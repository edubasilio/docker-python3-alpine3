FROM alpine:3.11.3

RUN apk update && apk upgrade

# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE 1

# install general tools
RUN apk add --no-cache --virtual .build-deps curl ca-certificates gcc netcat-openbsd linux-headers musl-dev libffi-dev jpeg-dev zlib-dev vim tree sqlite git

# intall python and develop tools
RUN apk add --no-cache python3 python3-dev py3-setuptools py3-virtualenv
RUN python3 -m ensurepip && rm -r /usr/lib/python*/ensurepip

# install pip3
RUN pip3 install --upgrade pip setuptools wheel
RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
RUN cd /usr/bin && ln -sf python3 python && ln -sf pip3 pip
RUN pip install bpython

# turn python3 default
RUN if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi

# install zsh and oh-my-zsh
RUN apk add zsh && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

RUN rm -r /root/.cache

CMD zsh
