FROM debian:stable
MAINTAINER aJchemist <ajchemist@turingmind.com>

ENV DEBIAN_FRONTEND noninteractive

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    date

RUN apt-get update \
    && apt-get install -y --no-install-recommends locales \
    && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales \
    && /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8
# ENV LANG C.UTF-8
# ENV LANGUAGE C.UTF-8
