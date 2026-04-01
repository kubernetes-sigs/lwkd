# Stylesheet for Last Week in Kubernetes Development

## Target Audience

The audience for LWKD is, in priority order:

1. Kubernetes contributors
2. Contributors to closely related projects
3. Engineers and documentation writers who work on Kubernetes distributions

Kubernetes users are not our audience, unless the are the kind of power user who tests alpha versions.

## Mission

The mission of LWKD is "keep up with Kubernetes development in 15 minutes a week."

Our goal is to provide the Kubernetes contributor community with a weekly summary of development activity and contributor-targeted announcements.  This allows them to keep up with what's going on across a very broad project.

The "15 minutes a week" part means that LWKD should be compact and terse.  This means both brevity and careful selection of which things are most important.

## General Style

Use short, direct sentences, as short as possible.

```
* kube-proxy gains an [nftables backend](https://github.com/kubernetes/kubernetes/pull/121046)
```

Use present tense.

```
* The APIserver supports [only JSON, YAML, and Protobuf](https://github.com/kubernetes/kubernetes/pull/121325)
```

Only use periods at the end of statements in sections of LWKD that are full paragraphs, such as Developer News and KEP of the Week.  Bullet-point entries should not have periods.  If you need to include two separate statements in one bullet item, use a semicolon.

```
* Prevent [accidental StatefulSet pod deletion](https://github.com/kubernetes/kubernetes/pull/120731) during rolling update
* Kubelet's `--node-ip` flag [initializes temporary IP addresses](https://github.com/kubernetes/kubernetes/pull/121028); this is aojea's workaround for cloud provider backwards compatibility
```

Links should be inline in the natural text. Do not attach them with a separate "here" or "on our website."

```
Contributor Summit Paris [schedule is live](https://www.kubernetes.dev/events/2024/kcseu/schedule/#schedule).
```

Use code formatting for variable names, commands, and switches, and optionally use it for feature gates.

```
* `nominalConcurrencyShares` [can be zero](https://github.com/kubernetes/kubernetes/pull/123001)
* `--node-labels` has been around for 28 releases, [maybe it's not alpha anymore](https://github.com/kubernetes/kubernetes/pull/123061)
```

Version numbers can be reported as either bare or with a "v", whatever seems appropriate.

```
* [grpc v1.62.0-pre1](https://github.com/grpc/grpc/releases/tag/v1.62.0-pre1) released
* [Prometheus 2.50.0-rc.0](https://github.com/prometheus/prometheus/releases/tag/v2.50.0-rc.0) released
```

Statements after bullets should use regular sentence case, unless they begin with the proper name of a component that is not usually capitalized.

```
* Show more info about [VolumeResourceClasses](https://github.com/kubernetes/kubernetes/pull/122640)
* [kube-apiserver now reports metrics for authorization decisions](https://github.com/kubernetes/kubernetes/pull/123333)
```

Things to avoid: passive tense ("The bug was fixed"), unnecessary paranthetical phrases ("the configuration of kubeadm" should be "kubeadm configuration"), repeating words ("Concurrency control for concurrent log rotation").

List of common terms and their capitalization:

```
Kubernetes
kubeadm
APIserver
CSI
etcd
Windows
gRPC
kubectl
K/kubelet
KEP
Prow
```

### Featured PRs

Each week, we try to find one or two PRs which are of special interest to our readers.  This could include PRs that do any of the following:

* make significant changes to how Kubernetes is built or tested
* re-organize the Kubernetes code or docs in a way that affects many contributors
* introduce a brand-new, interesting feature
* advance an interesting/major feature to GA
* fix a difficult problem with Kubernetes that has been open for years
* fix a major security vulnerability, particularly if changes to APIs are involved
* introduce new and interesting tests or test suites

Bug fixes, test-only changes, doc-only changes, moving features to beta, refactorings, and similar "minor" PRs are generally not interesting and should not be in the Featured PR section.  This does mean that some weeks, particularly during Code Freeze, there will be no PRs to feature.

The goal of the Featured PR section is to give readers *in-depth* coverage of one or two PRs, rather than trying to offer shallow coverage of all interesting PRs.  Coverage of a featured PR should include:

* names of contributors who worked on it
* any KEPs it's linked to
* links to any additional discussions, docs, or related issues
* links to related (sub)projects and repositories
* mentions of how the change will affect contributors and/or users
* discussion of the history of the PR, if any

This section is formatted as a major section with subsections:

```
## Featured PR

### [99999: PR Title From Github](https://github.com/kubernetes/kubernetes/pulls/99999)

[Joe Contributor](https://github.com/joecontributor) finally resolved [long-standing issue from 2022](https://github.com/k/k/issues/999999) by frobbijanging the thingamajig.  This required [adding a new E2E test](link to test) and requires [deprecating the v1beta2 API](link to API file or deprecation PR).  Please test that this resolves the issue for you. 
```

### KEP of the Week

The KEP of The Week section keeps our contributors aware of development planning in the project, particularly helping them keep on top of KEPs created by SIGs other than their own.  Writers should choose a KEP that has had significant activity in the last few weeks, which could be any of:

* has a currently open call for discussion or request for help
* just recently published
* being included as alpha for the first time in this release
* going to GA in this release
* having been recently refactored, rewritten, or heavily updated
* being closed/terminated/replaced after years of work

This KEP should be one that LWKD has not covered in the last 6 months, so search the LWKD repo for the KEP number to make sure.  Also, pick a KEP that you can tell a story about, either because it's generally interesting (e.g. new user-visible feature), has an interesting history, or because it's deeply technical and you can explain it to non-experts.

In exceptional weeks, LWKD might cover two KEPs because there's been a call for discussion on both of them.  90% of the time, though, writers will cover only one KEP.

KEPs can be covered in future tense ("This enhancement plans to ...") if the KEP is proposed and not yet accepted.  Once the KEP is in alpha state or later, it should be covered in present or past tense ("This enhancement implements ...", "KEP 0000 would have created ...").  Present tense is always acceptable.

This section should include all of the following information about the KEP:

* a summary of the proposed changes, including technical details if the writer understands them
* a brief history of the KEP/idea
* the KEP's current status, including level in this release, and expected timeline
* the names of contributors who are working on the KEP
* if the KEP is being discussed, the location of the discussion
* any current technical work happening this week with the KEP
* links to any related issues and/or recently created/merged PRs
* notes about changes that will affect the rest of Kubernetes, if any

The KEP of The Week Section is formatted this way:

```
## KEP of the Week

### [KEP-0000: SIG-KEP: Title Of KEP Here](https://github.com/kubernetes/enhancements/tree/master/keps/sig-someone/0000-this-kep-this-week)

This KEP implements Feature X, [proposed by SIG-something](/link/to/discussion/or/issue) in 2024.  Feature X will change the X interface of Kubernetes, allowing the use of protocol M and Q.  It replaces the old Y API, which will be deprecated after GA.  Priya Contributor and Yuan Maintainer are currently [working on the controller](/link/to/open/pr) and have [called for help on E2E tests](/link/to/kdev/post).

KEP 0000 is scheduled to be GA in 1.39, but will be postponed if testing requirements are incomplete.
```


### General Merge Reporting

Each week, we report merges that had some noticeable effect on either users or Kubernetes developers.  This includes new features, API changes, code reorganizations, new metrics, new tests, crash bug fixes, feature advancements, and a few other kinds of changes.

There's a few types of changes that aren't usually worth reporting.  You can use whether or not the merge rated a release note as somewhat of a guideline.  Beyond that, also base your selectivity on the volume of merges in a week; if it's an 80-PR week (on the standard query), then you want a higher threshold of significance.

Merges we should almost always publish include:

* Features (look for `kind/feature`)
* All deprecations
* API changes (look for the `kind/api-change` label)
* Major version updates to critical dependencies (golang, etcd, etc.)
* Changes that carry a release note (will be in the PR description)
* Feature promotions
* Fixes for crash bugs and/or security holes
* Changes that require contributors to modify their development environment or process (moving directories, updating build tools, etc.)
* New tests
* New monitoring fields/endpoints
* Any really large refactoring

Merges that we often skip reporting on include:

* Changes to code comments and internal code docs
* Alpha or beta releases of dependancies
* Minor fixes to unreleased alpha features
* Minor fixes to optional components (e.g. kubeadm, operators, drivers)
* Wording, grammar, or typo fixes to docs, help messages, and prompts
* Small refactorings

We never report cherry-picks.  Instead, report the original PR.

For merges, you are looking to summarize what's important about the merge in one short statement, ideally 4-10 words.  This statement should:

* Emphasize how the change will affect contributors or users, rather than which object changed
* Describe the new behavior in positive statement terms, rather than using "fix" or "changed."  "Fix X" should usually only be used for cases where the merge was primarily preventing a crash bug, and even then "Prevent" is better.

```
* Kubelet concurrent log rotation is configurable [through containerLogMaxWorkers](https://github.com/kubernetes/kubernetes/pull/114301)
* [Job controller only logs deletionTimestamp](https://github.com/kubernetes/kubernetes/pull/121554) if it's not nil
```

* For some merges, the only reasonable description does focus on the change, using "Add", "Prevent", "Reduce", and similar.

```
* Prevent race condition between [kubelet and CSI external resizer](https://github.com/kubernetes/kubernetes/pull/123055)
```

* If there are multiple merges around the same component the same week, consider consolidating them into a list.  New metrics should usually be given as a list.

```
* Kubeadm: add more [key encryption options](https://github.com/kubernetes/kubernetes/pull/123054), apply patches correctly [to ConfigMap](https://github.com/kubernetes/kubernetes/pull/123093), check [if node is control plane](https://github.com/kubernetes/kubernetes/pull/123077) during upgrade
```

* It's OK for entries to be sentence fragments if the meaning is clear

```
* A new [`ServiceCIDR` type](https://github.com/kubernetes/kubernetes/pull/116516)
```

And, some formatting for specific merge types:

```
## Promotions
* [PodHostIPs to Beta](https://github.com/kubernetes/kubernetes/pull/121477)

## Version Updates
* [etcd to v3.5.10](https://github.com/kubernetes/kubernetes/pull/121573)
* [go to 1.21.7](https://github.com/kubernetes/kubernetes/pull/123230) in 1.26 through 1.29, and [to 1.22 in 1.30](https://github.com/kubernetes/kubernetes/pull/123217)

```

### Developer News

Developer News should share with contributors the kinds of announcements that are also posted to `kubernetes/dev` and `#kubernetes-org-members`.

In general, you should not repeat any news that has already appeared in LWKD. The main exception to this is major, project-spanning changes or event related topcis like contributor summit information, which have been hard to get people to pay attention to (i.e. moving the container images). For those cases you might want to run them 2-3 times.

Some other style notes:

* Where possible, link to the thing itself (i.e. KEP, survey, issue, policy document) rather than the mailing list message about the thing
* Give names for changes of leadership

### Release Schedule

This is better explained with a template:

```
## Release Schedule

**Next Deadline: Item From the Release Schedule, Date**

Short paragraph about the state of the release and what contributors/maintainers should be doing right now.

Note about upcoming patch releases or recently published patch releases.
```

Now some specifics:

* The Next Deadline should be a major item on the release schedule, such as PRR deadline, Docs due, Code Freeze, etc.  It shouldn't be, say, an alpha release.
* You can get information about next deadline on the [release information page](https://www.kubernetes.dev/resources/release/#timeline).
* Upcoming patch release information can be found on the [patch release page](https://kubernetes.io/releases/patch-releases/).
* You can also checkout the [Kubernetes dev mailing group](https://groups.google.com/a/kubernetes.io/g/dev) to get recent updates about release information.
* The week of cherry pick deadlines, report that deadline.

```
October Patch Release cherry-picks are due this Friday (October 13th).
```

* The week that patch releases are due to come out, report that.

```
Patch releases are expected for all supported versions this week.
```

* The week after patch releases come out, report that, including anything notable (particularly CVEs) fixed in that patch release.

```
Patch releases [1.30.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md), [1.29.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md), [1.28.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md), and [1.27.14](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md) are available. This is largely a bigfix release, including patch some 1.30 regressions, and an golang update.
```

Note the link to the CHANGELOG entries, rather than to the email announcements or the specific branch releases.  This allows us to skip updating the links every month.

* Remember to report any versions which are about to be, or are already, EOL.

```
This will be the last update for version 1.26. if you are still using 1.26, start planning your upgrade now.
```

### Version Updates and Subproject Updates

There's two very similar sections in LWKD, one called `Version Updates` and one called `Subproject and Dependency Updates`. While there is some flexibility in which section a particular news item goes in, here are the guidelines:

**Version Updates**: New versions of build dependencies and some minor subprojects of Kubernetes.  Usually the news is not about a release, but rather which version is included with/required for/supported by Kubernetes.  Examples would be updates to our required version of golang or etcd.  We also usually put update releases from minor subprojects here, such as cri-tools or cadvisor.

Generally these items come from PRs in k/k repository, or announcements on the Dev list. A good rule is: "If you're not going to say anything about the update, it probably goes in Version Updates rather than subprojects."

Accordingly, this is the format for Version Updates:

```
* [library to v#.#.#](link to PR or release announcement)
```

**Subproject and Dependency Updates**: This section holds update summaries for closely related projects from [a short list](https://github.com/kubernetes-sigs/lwkd/blob/main/scripts/release-crawler/README.md).  These are links to full release announcements, generally gathered by the Subprojects Bot.

The format template for these announcements is:

```
* [projectname v#.#.#](link to release announcement): change 1, change 2; also [v#.#.#](link)
```

The changes listed are 2-4 word summaries of major changes in that release (e.g. "fix CVE 2024-0576").  The "also" portion is for listing any backported update releases at the same time.
