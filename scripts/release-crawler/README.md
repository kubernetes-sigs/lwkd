# Release Crawler

The goal of Release-Crawler is to fetch Release notes of configured list of repositories of the previous week. This gives
an easy overview of updates of relevant projects to put into the LWKD newsletter.

The collected release notes are stored as html and as MD format to be an easy usage.

## Installation & Development
```

    // install the dependencies
    go mod download

    // run script
    go run main.go

    //build go binary
    go build

```




## Crawled Releases

| Project        |Repository                        |GitHub                         |
|----------------|-------------------------------|-----------------------------|
|coredns|coredns           |[CoreDNS](https://github.com/coredns/coredns)|
|kubernetes-csi|csi-driver-nfs           |[NFS CSI](https://github.com/kubernetes-csi/csi-driver-nfs)|
|kubernetes-csi|csi-driver-host-path           |[Host Path CSI](https://github.com/kubernetes-csi/csi-driver-host-path)|
|kubernetes-csi|csi-driver-smb           |[SMB CSI](https://github.com/kubernetes-csi/csi-driver-smb )|
|kubernetes-csi|csi-driver-vsphere           |[vsphere CSI](https://github.com/kubernetes-csi/csi-driver-vsphere)|
|containernetworking|cni           |[CNI](https://github.com/containernetworking/cni)|
|cri-o|cri-o           |[Cri-O](https://github.com/cri-o/cri-o)|
|cri-o|ocicni           |[Cri-O CNI](https://github.com/cri-o/ocicni)|
|containerd|containerd           |[ContainerD](https://github.com/containerd/containerd)|
|containerd|nerdctl           |[nerdctl](https://github.com/containerd/nerdctl)|
|kubernetes|kops           |[kops](https://github.com/kubernetes/kops)|
|kubernetes|kubeadm           |[kubeADM](https://github.com/kubernetes/kubeadm)|
|kubernetes|ngninx-ingress           |[NGINX Ingress](https://github.com/kubernetes/ngninx-ingress )|
|kubernetes|cluster-api           |[ClusterAPI](https://github.com/kubernetes/cluster-api)|
|kubernetes|cluster-api-provider-vsphere|[Cluster API Provider vSphere](https://github.com/kubernetes-sigs/cluster-api-provider-vsphere)|
|kubernetes-sigs|kubespray          |[Kubespray](https://github.com/kubernetes-sigs/kubespray)|
|etcd-io|etcd           |[ETCD](https://github.com/etcd-io/etcd)|
|grpc|grpc           |[GRPC](https://github.com/grpc/grpc)|
|golang|go           |[Golang](https://github.com/golang/go)|
