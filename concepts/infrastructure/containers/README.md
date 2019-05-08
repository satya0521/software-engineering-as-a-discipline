# Containers

- [Containers](#containers)
  - [Open Container Initiative](#open-container-initiative)
  - [Host Operating Systems (Minimalist)](#host-operating-systems-minimalist)
  - [Container Image](#container-image)
    - [Base OS images](#base-os-images)
    - [Docker image management](#docker-image-management)
    - [Container image registries](#container-image-registries)
      - [Client-server](#client-server)
      - [P2P](#p2p)
  - [Container Runtime](#container-runtime)
    - [Container runtime landscape](#container-runtime-landscape)
    - [Docker container management](#docker-container-management)
  - [References](#references)

## Open Container Initiative

[Open Container Initiative](https://www.opencontainers.org/) is a lightweight, open governance structure (project), formed under the auspices of the Linux Foundation, for the express purpose of creating open industry standards around container formats and runtime.
The OCI was launched on June 22nd 2015 by Docker, CoreOS and other leaders in the container industry.

The OCI currently contains two specifications: the Runtime Specification ([runtime-spec](http://www.github.com/opencontainers/runtime-spec)) and the Image Specification ([image-spec](http://www.github.com/opencontainers/image-spec)).
The Runtime Specification outlines how to run a "[filesystem bundle](https://github.com/opencontainers/runtime-spec/blob/master/bundle.md)" that is unpacked on disk.
At a high-level an OCI implementation would download an OCI Image then unpack that image into an OCI Runtime filesystem bundle. At this point the OCI Runtime Bundle would be run by an OCI Runtime.

OCI Image Format specification defines how to create an OCI Image, which will generally be done by a build system, and output an [image manifest](https://github.com/opencontainers/image-spec/blob/master/manifest.md), a [filesystem (layer) serialization](https://github.com/opencontainers/image-spec/blob/master/layer.md), and an [image configuration](https://github.com/opencontainers/image-spec/blob/master/config.md).
At a high level the image manifest contains metadata about the contents and dependencies of the image including the content-addressable identity of one or more filesystem serialization archives that will be unpacked to make up the final runnable filesystem.
The image configuration includes information such as application arguments, environments, etc.
The combination of the image manifest, image configuration, and one or more filesystem serializations is called the OCI Image.

## Host Operating Systems (Minimalist)

List of minimalist operating systems:

- [Project Atomic](http://www.projectatomic.io/)
- [CoreOS](https://coreos.com/)
- [Ubunty Snappy](https://developer.ubuntu.com/core)
- [RancherOS](http://rancher.com/rancher-os/)
- [VMWare Photon](https://vmware.github.io/photon/)

## Container Image

### Base OS images

Minimal OS is preferred as they would save a great deal of time in building containers.

BusyBox is not recommended as it has breaking changes to its package management.

Docker, Inc has switched the Docker official image library from Ubuntu to Alpine.

- Minimal OS:
  - [Red Hat Universal Base Image](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image)
    - `docker image pull registry.access.redhat.com/ubi7/ubi-minimal`
  - [Alpine Linux](https://alpinelinux.org/) is built around musl libc and BusyBox
    - `docker image pull alpine:edge`
  - [BusyBox](https://www.busybox.net/)
    - `docker image pull busybox:1`
- Full OS:
  - [ubuntu](https://hub.docker.com/_/ubuntu/)
  - [centos](https://hub.docker.com/_/centos/)
  - [debian](https://hub.docker.com/_/debian/)
  - [amazonlinux](https://hub.docker.com/_/amazonlinux/)
  - [fedora](https://hub.docker.com/_/fedora/)
  - [opensuse](https://hub.docker.com/_/opensuse/)
  - [oraclelinux](https://hub.docker.com/_/oraclelinux/)

### Docker image management

Pull an image: `docker image pull {image}`

Building an image: `docker image build -t {registry}/{image}:{tag} -f {Dockerfile_path}`

Push an image: `docker image push {image}`

### Container image registries

#### Client-server

| Organization                      | Hosted                                | On-premises                                                                                   | Cloud                                                                            |
| --------------------------------- | ------------------------------------- | --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| Cloud Native Computing Foundation |                                       | [Harbor](https://goharbor.io/)                                                                |
| Docker and SUSE                   |                                       | [Docker Registry](https://github.com/docker/distribution), [SUSE Portus](http://port.us.org/) |
| Docker                            | [Docker Hub](https://hub.docker.com/) | [Docker Trusted Registry](https://docs.docker.com/ee/dtr/)                                    |
| Red Hat                           | [Quay.io](https://quay.io/search)     | [Red Hat Quay](https://www.openshift.com/products/quay)                                       |
| JFrog                             |                                       | [JFrog Artifactory](https://www.jfrog.com/confluence/display/RTF/Docker+Registry)             |
| Sonatype                          |                                       | [Nexus Repository 3](https://help.sonatype.com/repomanager3/formats/docker-registry)          |
| Amazon Web Services               |                                       |                                                                                               | [Amazon Elastic Container Registry (ECR)](https://aws.amazon.com/ecr/)           |
| Microsoft Azure                   |                                       |                                                                                               | [Azure Registry](https://azure.microsoft.com/en-us/services/container-registry/) |
| Google Cloud Platform             |                                       |                                                                                               | [Google Container Registry](https://cloud.google.com/container-registry/)        |

#### P2P

- Cloud Native Computing Foundation
  - [Dragonfly](https://d7y.io/en-us/)
- Uber
  - [Kraken](https://eng.uber.com/introducing-kraken/)

## Container Runtime

### Container runtime landscape

Docker and rkt are the two well known container engines.

[containerd](https://github.com/containerd/containerd) is an industry-standard container runtime with an emphasis on simplicity, robustness and portability.
It is available as a daemon for Linux and Windows, which can manage the complete container lifecycle of its host system: image transfer and storage, container execution and supervision, low-level storage and network attachments, etc..
containerd is designed to be embedded into a larger system, rather than being used directly by developers or end-users.

[runc](https://github.com/opencontainers/runc) is a CLI tool for spawning and running containers according to the OCI specification.

![containerd architecture](https://containerd.io/img/architecture.png)

[Kubernetes Container Runtime Interface](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)

[CRI-O](https://github.com/cri-o/cri-o) is an implementation of the Kubernetes CRI (Container Runtime Interface) to enable using OCI (Open Container Initiative) compatible runtimes.
It is a lightweight alternative to using Docker as the runtime for kubernetes.
It allows Kubernetes to use any OCI-compliant runtime as the container runtime for running pods.
Today it supports runc and Kata Containers as the container runtimes but any OCI-conformant runtime can be plugged in principle.
CRI-O supports OCI container images and can pull from any container registry.
It is a lightweight alternative to using Docker, Moby or rkt as the runtime for Kubernetes.

![cri-o architecture](https://cri-o.io/assets/images/architecture.png)

### Docker container management

Running a container: `docker container run -it --rm --name {container_name} {image_name}`

Access shell of a running container: `docker container exec -it {container_name} /bin/sh`

Configure container DNS:

```sh
docker container run \
  -d \
  --dns 10.3.x.x \
  --dns 10.4.x.x \
  --dns-search example.com \
  --name {container_name} \
  {image_name}
```

## References

- [About - Open Containers Initiative](https://www.opencontainers.org/about)
- [The New Minimalist Operating Systems](https://blog.docker.com/2015/02/the-new-minimalist-operating-systems/)
- [Rise of the Container-focused Operating Systems](https://thenewstack.io/docker-fuels-rethinking-operating-system/)
