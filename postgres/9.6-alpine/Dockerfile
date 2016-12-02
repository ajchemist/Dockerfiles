FROM postgres:9.6-alpine
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN apk add --update tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    && apk del tzdata
