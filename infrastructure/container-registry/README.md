# Container Registry

## Base OS images

Minimal OS is preferred as they would save a great deal of time in building containers.

BusyBox is not recommended as it has breaking changes to its package management.

Docker, Inc has switched the Docker official image library from Ubuntu to Alpine.

- Minimal OS:
  - [alpine](https://hub.docker.com/_/alpine/)
  - [busybox](https://hub.docker.com/_/busybox/)
- Full OS:
  - [ubuntu](https://hub.docker.com/_/ubuntu/)
  - [centos](https://hub.docker.com/_/centos/)
  - [debian](https://hub.docker.com/_/debian/)
  - [amazonlinux](https://hub.docker.com/_/amazonlinux/)
  - [fedora](https://hub.docker.com/_/fedora/)
  - [opensuse](https://hub.docker.com/_/opensuse/)
  - [oraclelinux](https://hub.docker.com/_/oraclelinux/)

## Build a image

Building an image: `docker image build -t registry.example.com/image-name:tag -f Dockerfile`

## Container registries

- Artifactory
- Docker Trusted Registry
- Quay Enterprise
