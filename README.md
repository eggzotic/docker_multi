# Docker Multi-platform Image

There is almost nothing interesting in this repo - from a code perspective. But...

Sample of how to produce a multi-platform docker image. These can be created on my M3-based Mac. Shows that mainstream arch (e.g. Intel (AMD64)) images can be created using only stock-standard Docker tools, on your local workstation. Ideally any user "out there" can `docker run ...` the image so-produced.

Create using `docker buildx build --platform linux/amd64,linux/arm64 -t richardexaba/multi-platform-basic:latest --push .`

Note that the `--push` is necessary as it seems *not* possible to `--load` the multi-platform image directly into local docker. Instead you push it to DockerHub, and subsequently `docker pull ...` or directly `docker run ...` it which pulls down only the image for you local workstations CPU arch.

To exit (stop) the running container, run this from the container shell (Exec): `touch /tmp/done`

Sample pre-built image of this at https://hub.docker.com/r/richardexaba/multi-platform-basic

Richard.
