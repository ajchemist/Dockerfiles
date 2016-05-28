FROM nginx:stable
MAINTAINER aJchemist <ajchemist@turingmind.com>

ENV DEBIAN_FRONTEND noninteractive
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo Asia/Seoul > /etc/timezone                      && \
    date

RUN apt-get update

RUN apt-get install -y locales && \
    dpkg-reconfigure locales   && \
    locale-gen C.UTF-8         && \
    /usr/sbin/update-locale LANG=C.UTF-8

RUN apt-get install -y apache2-utils

ENV LANG     C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL   C.UTF-8
