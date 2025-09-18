# Contributing Guidelines

Welcome to LWKD. We are excited about the prospect of you joining our [community](https://git.k8s.io/community)! LWKD and the Kubernetes community abides by the CNCF [code of conduct](code-of-conduct.md). Here is an excerpt:

_As contributors and maintainers of this project, and in the interest of fostering an open and welcoming community, we pledge to respect all people who contribute through reporting issues, posting feature requests, updating documentation, submitting pull requests or patches, and other activities._

## Contributing

Every Monday, a new issue of LWKD will come out.  Generally we start work on Monday afternoons (Pacific time), and will push an empty template on a branch named after the Sunday end of the week (e.g. 20210418).  You can find [the base template here](https://github.com/lwkd/lwkd.github.io/blob/main/template.md).

You are welcome to add items as a pull request against this branch once it's created; if it hasn't been created yet, feel free to ping @jberkus or @coderanger on Slack to ask us to start it for you.

If you don't feel like creating a pull request, or there's too many edit conflicts already, then add your item as an Issue.

What we're looking for:

* Reports on PRs and merges for significant features and changes to core Kubernetes and its close components (like Kubeadm and CSI).
* Summaries of the Community Meeting and any Steering Committee meetings.
* Updates, deadlines, and current status on the release in progress.
* Notices of deprecated features, plugins, and APIs.
* Notices of version number changes and dependency version changes.
* Summary of changes in kubernetes-associated repositories such as CSI, Helm, and KubeVirt (based on the teams for these apps submitting the updates, our editorial staff doesn't track those).

We are **not** looking for information about upcoming events, external blog posts, new projects or products, or other Kubernetes "ecosystem" news, all of which is well-covered by [KubeWeekly](https://kubeweekly.io/).

More than anything, please **be brief**.  A major goal of LWKD is to provide a summary of Kubernetes activity which can be taken in in 15 minutes or less.  The ideal item for LWKD is one sentence and a link.

You may optionally credit yourself at the end of each item you add with your initials in italics, like so:

* We now have automated tests using the [vSphere Cloud Provider simulator](https://github.com/kubernetes/kubernetes/pull/55918) *JMB*

Should you do this, please make sure to add your initials, name and contact link to the authors.md file.

All contributors will be honored in the Authors.md file for a year or more after their last contribution.

## Developer News

Developer News should include anything of interest to the whole pool of Kubernetes developers, which should include:

* Summaries of any significant items from the kubernetes/dev mailing list
* Any changes to SIG/Team leadership announced in the last week
* Updates on upcoming Kubernetes Contributor Summits
* Major Kubecon deadlines (announced only once), with a focus on maintainer stuff
* Other upcoming events and code initiatives, like the Security Slam or mentoring programs
* Security vulnerability announcements
* Major changes to community infrastructure (like testing framework) or development process
* Requests for feedback or surveys targeting all Kubernetes devs by SIGs or the CNCF (but *not* from 3rd parties)
* Steering committee and other community elections
* Major Steering decisions that affect a lot of developers

Sources of this information include, but are not limited to:

* The kubernetes.io/dev mailing list archives
* Kubernetes.dev/events website and the Summit Team
* Chairs and Leads slack channel
* Issues and PRs in Community, Enhancements, and Test-Infra repos
* Steering committee meeting minutes

## Searching for PRs

We search for significant PRs merged in the last week against kubernetes/kubernetes using this github query:

```
is:pr merged:>YYYY-MM-DD label:release-note,release-note-action-required,"kind/deprecation","kind/api-change","kind/feature","size/l"
```

... where YYYY-MM-DD is one week ago

## Format and Style

Please see [our stylesheet](STYLESHEET.md)

## Contact Information

- [Contributor Comms Slack channel](https://kubernetes.slack.com/messages/sig-contribex-comms); tag @jberkus and @coderanger in your query

## Additional Resources

- [Contributor License Agreement](https://git.k8s.io/community/CLA.md) Kubernetes projects require that you sign a Contributor License Agreement (CLA) before we can accept your pull requests
- [Kubernetes Contributor Guide](https://git.k8s.io/community/contributors/guide) - Main contributor documentation, or you can just jump directly to the [contributing section](https://git.k8s.io/community/contributors/guide#contributing)
- [Contributor Cheat Sheet](https://git.k8s.io/community/contributors/guide/contributor-cheatsheet) - Common resources for existing developers
