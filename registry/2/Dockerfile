FROM registry:2
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN apk add --no-cache --update tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    && apk del tzdata
