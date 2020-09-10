# Alpine 3.11 with Python 3
![GitHub last commit](https://img.shields.io/github/last-commit/edubasilio/docker-python3-alpine3?style=plastic)
![Docker Automated build](https://img.shields.io/docker/automated/basiliocode/python3-alpine3?style=plastic)
![MicroBadger Layers](https://img.shields.io/microbadger/layers/basiliocode/python3-alpine3?style=plastic)
![MicroBadger Size](https://img.shields.io/microbadger/image-size/basiliocode/python3-alpine3?style=plastic)

## Pre-Instaled packages:
* python 3.8
* python3-dev
* py3-setuptools
* py3-virtualenv
* pip3
* vim
* sqlite
* tree
* curl
* build-deps
* ca-certificates
* gcc
* linux-headers
* musl-dev
* libffi-dev
* jpeg-dev
* zlib-dev
* bpython
* zsh & oh-my-zsh

## Dockerfile
For use this image in your Dockerfile:
```docker
FROM basiliocode/python3-alpine3
RUN apk update && apk upgrade
```

### Set locale
Example for set _São_Paulo_:
```docker
RUN apk add --no-cache tzdata && cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && echo "America/Sao_Paulo" > /etc/timezone
```

### Install packeges from [APK](https://pkgs.alpinelinux.org/packages)
Example for install PostgreSQL Client:
```docker
RUN apk add --no-cache postgresql-dev postgresql-client
```

### Install packages from [PyPI](https://pypi.org/)
Example for [poetry](https://python-poetry.org/) and [pipenv](https://pipenv.pypa.io/):
```docker
RUN pip install poetry pipenv
```
