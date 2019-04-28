# Docker

## Installation

macOS: <https://docs.docker.com/docker-for-mac/install/>

Windows: <https://docs.docker.com/docker-for-windows/>

RHEL: <https://docs.docker.com/install/linux/docker-ee/rhel/>

## Running a container

`docker container run -it --rm --name {container_name} {image_name} /bin/sh`

## Access shell of a running container

`docker container exec -it {container_name} /bin/sh`

## Configure container DNS

```sh
docker run \
  -d \
  --dns 10.x.x.x \
  --dns 10.x.x.x \
  --dns-search example.com \
  --name bash-container \
  registry.example.com/alpine
```
