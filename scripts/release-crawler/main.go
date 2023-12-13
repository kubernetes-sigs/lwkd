package main

import (
"context"
"fmt"
"html/template"
"log"
"os"
"time"

"github.com/gomarkdown/markdown"

"github.com/gomarkdown/markdown/html"
"github.com/gomarkdown/markdown/parser"
"github.com/google/go-github/v57/github"
)

var repos map[string][]string = map[string][]string{
	"coredns": []string{"coredns"},
	"kubernetes-csi": []string{
		"csi-driver-nfs",
		"csi-driver-host-path",
		"csi-driver-smb",
		"csi-driver-vsphere",
	},
	"containernetworking": []string{"cni"},
	"cri-o": []string{
		"cri-o",
		"ocicni",
	},
	"containerd": []string{
		"containerd",
		"nerdctl",
	},
	"kubernetes": []string{
		"kops",
		"kubeadm",
		"ngninx-ingress",
		"cluster-api",
	},
	"etcd-io": []string{
		"etcd",
	},
	"grpc" : []string{
		"grpc",
	},
	"golang": []string{
		"go",
	},


}

// mdToHTML converts markdown to HTML

func mdToHTML(md []byte) []byte {
	// create markdown parser with extensions
	extensions := parser.CommonExtensions | parser.AutoHeadingIDs | parser.NoEmptyLineBeforeBlock
	p := parser.NewWithExtensions(extensions)
	doc := p.Parse(md)

	// create HTML renderer with extensions
	htmlFlags := html.CommonFlags | html.HrefTargetBlank
	opts := html.RendererOptions{Flags: htmlFlags}
	renderer := html.NewRenderer(opts)

	return markdown.Render(doc, renderer)
}

func createHTMLFile(filename string, data map[string]string) error {

	templateContent, err := os.ReadFile("template.html")
	if err != nil {
		log.Fatal(err)
	}

	funcMap := template.FuncMap{
		"safeHTML": func(str string) template.HTML {
			return template.HTML(str)
		},
	}

	tmpl, err := template.New("template").Funcs(funcMap).Parse(string(templateContent))
	if err != nil {
		log.Fatal(err)
	}

	// remove File if exists
	if _, err := os.Stat("release-notes-html/"+filename+ ".html"); err == nil {
		err = os.Remove("release-notes-html/"+filename+ ".html")
		if err != nil {
			return err
		}
	}
	// Create the file and get the file pointer
	file, err := os.Create("release-notes-html/"+filename + ".html")
	if err != nil {
		return err
	}
	defer file.Close()

	// Execute the template with the file pointer and data
	err = tmpl.Execute(file, data)

	//data escaped
	if err != nil {
		return err
	}

	return nil
}

func createMDFile(filename string, mdContent string) error {

	// remove File if exists
	if _, err := os.Stat("release-notes-md/"+filename+ ".md"); err == nil {
		err = os.Remove("release-notes-md/"+filename+ ".md")
		if err != nil {
			return err
		}
	}
	// Create the file and get the file pointer
	file, err := os.Create("release-notes-md/"+filename+ ".md")
	if err != nil {
		return err
	}
	defer file.Close()

	_, err = file.WriteString(mdContent)

	return err
}

// main function
func main() {
	ctx := context.Background()

	now := time.Now()
	client := github.NewClient(nil)
	oneWeekAgo := now.AddDate(0, 0, -7)

	var mdContent string
	var htmlContent string
	htmlContent += "<h1>Latest Releases for " + oneWeekAgo.Format("2006-01-02") + "</h1>"
	mdContent += "# Latest Releases for " + oneWeekAgo.Format("2006-01-02") + " "
	weekfile := oneWeekAgo.Format("2006-01-02")


	for p, rs := range repos {
		for _, r := range rs {
			releases, _, err := client.Repositories.ListReleases(ctx, p, r, &github.ListOptions{
				PerPage: 5,
			})

			if err == nil {
				htmlContent += "<h2>" + p + "/" + r + "</h2> "
				mdContent += "## " + p + "/" + r
				for _, release := range releases {
					if release.GetPublishedAt().After(oneWeekAgo) {

						htmlContent += "<h3>Release notes for " + release.GetName() + "</h3>"
						htmlContent += "<h4>" + release.GetPublishedAt().Format("2006-01-02") + "</h4>"

						mdContent += "### Release notes for " + release.GetName()
						mdContent += "#### " + release.GetPublishedAt().Format("2006-01-02")


						content := []byte(release.GetBody())

						mdContent += string(content)
						htmlContent += string(mdToHTML(content))
						htmlContent += "<br>"

					}

				}
			} else {
				fmt.Println(err)
			}

		}
	}

	data := make(map[string]string)
	data["content"] = htmlContent
	data["title"] = "Whats new in the last week"
	data["date"] = now.Format("2006-01-02")

	err := createHTMLFile(weekfile, data)
	if err != nil {
		log.Fatal(err)
	}

	err = createMDFile(weekfile, mdContent)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Done")
}
