FROM openjdk:8u131-jre-alpine
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN apk add --no-cache --update tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    && apk del tzdata

VOLUME ["/srv"]
WORKDIR /srv

ENTRYPOINT ["java"]
