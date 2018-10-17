FROM openjdk:8u171-jre-alpine
LABEL maintainer "aJchemist <valchemist@me.com>"
# https://hub.docker.com/_/openjdk/


RUN apk add --no-cache --update tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    && apk del tzdata


VOLUME ["/srv"]
WORKDIR /srv


ENTRYPOINT ["java"]
