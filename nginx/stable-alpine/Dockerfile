FROM nginx:stable-alpine
MAINTAINER aJchemist <alchemist@turingmind.com>

# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk add --update tzdata                              && \
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo Asia/Seoul > /etc/timezone                      && \
    date                                                 && \
    apk del tzdata
