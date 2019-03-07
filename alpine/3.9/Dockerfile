FROM alpine:3.9
LABEL maintainer "aJchemist <valchemist@me.com>"


# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk add --no-cache --update tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    && apk del tzdata \
    && apk add --no-cache socat
