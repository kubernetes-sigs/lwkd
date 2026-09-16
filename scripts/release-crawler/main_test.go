package main

import (
	"strings"
	"testing"
)

func TestMdToHTML(t *testing.T) {
	cases := []struct {
		name string
		in   string
		want string
	}{
		{"heading", "# Title", "<h1"},
		{"bold", "**bold**", "<strong>bold</strong>"},
		{"link", "[text](https://example.com)", `<a href="https://example.com" target="_blank">text</a>`},
		{"paragraph", "just text", "<p>just text</p>"},
	}
	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			got := string(mdToHTML([]byte(c.in)))
			if !strings.Contains(got, c.want) {
				t.Errorf("mdToHTML(%q) = %q, want it to contain %q", c.in, got, c.want)
			}
		})
	}
}

func TestMdToHTMLEmptyInput(t *testing.T) {
	got := string(mdToHTML([]byte("")))
	if got != "" {
		t.Errorf("mdToHTML(\"\") = %q, want empty string", got)
	}
}
