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

### Merge Reporting

Each week, we report merges that had some noticeable effect on either users or Kubernetes developers.  This includes new features, API changes, code reorganizations, new metrics, new tests, crash bug fixes, feature advancements, and a few other kinds of changes.  

There's a few types of changes that aren't usually worth reporting, such as internal code documentation updates (unless they're very large), fixes to unreleased features, and cherry-picks to older versions.  You can use whether or not the merge rated a release note as somewhat of a guideline.  Beyond that, also base your selectivity on the volume of merges in a week; if it's an 80-PR week (on the standard query), then you want a higher threshold of significance.

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
* Upcoming patch release information can be found on the [patch release page](https://kubernetes.io/releases/patch-releases/).
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
Patch releases [1.28.4](https://groups.google.com/g/kubernetes-announce/c/k5HaLtE8jnM), [1.27.8](https://groups.google.com/g/kubernetes-announce/c/GLQ2R0e9OaE), [1.26.11](https://groups.google.com/g/kubernetes-announce/c/iHSD1DMNjd8) and [1.25.16](https://groups.google.com/g/kubernetes-announce/c/CNZH-8Cn_n8) came out last week, including golang updates.
```

* Remember to report any versions which are about to be, or are already, EOL.
