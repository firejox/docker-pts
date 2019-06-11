# Docker-pts

A workaround to dockerize phoronix test suite.

## Where to get it

you can download from [docker hub](https://hub.docker.com/r/firejox/docker-pts)
```sh
docker pull firejox/docker-pts
```

## How to use it

* basic command

```sh
docker run -ti firejox/docker-pts
``` 

* start benchmark without shell

```sh
docker run -ti firejox/docker-pts benchmark pts/encode-mp3
```

* give external mounting for test-suites storage

```sh
docker run -ti -v volume-or-path-for-pts:/mnt/pts firejox/docker-pts
```
