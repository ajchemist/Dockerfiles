FROM postgres:9.6
MAINTAINER aJchemist <ajchemist@turingmind.com>

ENV DEBIAN_FRONTEND noninteractive
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo Asia/Seoul > /etc/timezone                      && \
    date

ENV LANG     C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL   C.UTF-8

RUN apt-get update
RUN apt-get install -y --no-install-recommends locales && \
    dpkg-reconfigure locales                           && \
    /usr/sbin/update-locale LANG=C.UTF-8 LC_ALL=C.UTF-8 LC_MESSAGES=C.UTF-8
