FROM alpine:3.4
MAINTAINER aJchemist <ajchemist@turingmind.com>

# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk add --update tzdata                              && \
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo Asia/Seoul > /etc/timezone                      && \
    apk del tzdata
