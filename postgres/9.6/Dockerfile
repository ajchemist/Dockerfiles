FROM postgres:9.6
MAINTAINER aJchemist <ajchemist@turingmind.com>

ENV DEBIAN_FRONTEND noninteractive

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    date

ENV LC_ALL en_US.UTF-8
