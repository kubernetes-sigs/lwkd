* CFS quota timeout is [now configurable](https://github.com/kubernetes/kubernetes/pull/63437), eliminating a major failure-to-deploy issue experienced by many users
* ImageLocalityPriority is now [available by default](https://github.com/kubernetes/kubernetes/pull/64662) for scheduling.
* The Aggregation API [finally has e2e tests](https://github.com/kubernetes/kubernetes/pull/63947)
* [Add audit annotations](https://github.com/kubernetes/kubernetes/pull/58679) for admission webhooks

* Node-level [usernamespaces are now a thing](https://github.com/kubernetes/kubernetes/pull/64005), finally eliminating the need to run applications as container root (at least with the alpha gate)
* [Stop scoring all nodes in the cluster](https://github.com/kubernetes/kubernetes/pull/66733) every time, to reduce overhead in large clusters
* [Create and manage node leases](https://github.com/kubernetes/kubernetes/pull/66257) in the Kubelet, per [KEP 9](https://github.com/kubernetes/community/blob/master/keps/sig-node/0009-node-heartbeat.md)
* [Add "MayRunAs" strategy](https://github.com/kubernetes/kubernetes/pull/65135) for GID allocation
* [Add "ProcMount" option](https://github.com/kubernetes/kubernetes/pull/64283) for container SecurityContext, in order to allow access to /proc without running privileged
* Horizontal Pod Autoscaling now [has metric selectors](https://github.com/kubernetes/kubernetes/pull/64097), making it useful. Includes `autoscaling/v2beta2` and `custom_metrics/v1beta2`

* [Quota configuration API to v1beta1](https://github.com/kubernetes/kubernetes/pull/66156)
* [Audit API to stable](https://github.com/kubernetes/kubernetes/pull/65891)
