FROM ubuntu:18.04
MAINTAINER Hermann Krumrey <hermann@krumreyh.com>

ENV DEBIAN_FRONTEND=noninteractive

ADD ./ xkcd-bot
RUN apt update && \
    apt install locales -y && \
    locale-gen en_US.UTF-8 && update-locale en_US.UTF-8 && \
    apt install -y \
    python3 python3-pip && \
    rm -f /usr/bin/python && \
    rm -f /usr/bin/pip && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    cd xkcd-bot && \
    python setup.py install && \
    mkdir ~/.config/xkcd-bot -p

ENTRYPOINT ["/usr/local/bin/xkcd-bot"]

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_TYPE=en_US.UTF-8
