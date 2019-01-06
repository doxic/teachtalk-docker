# Server Templating Tools

Let's continue with our example: Build a docker image based on Ubuntu 16.04.

> This is a rather useless example!


## Prerequisites
* [Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Instructions

Build new image from Dockerfile
```
docker build -t apache-php .
```

Run container from image
```
docker run -p 80:80 -d apache-php
```

## Acknowledgments
* [Dockerfile](https://hub.docker.com/r/eboraas/apache)
