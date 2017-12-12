FROM openjdk:8u151-jre
MAINTAINER aJchemist <ajchemist@turingmind.com>

# https://hub.docker.com/_/openjdk/

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/zoneinfo \
    && echo Asia/Seoul > /etc/timezone;

VOLUME ["/srv"]
WORKDIR /srv

ENTRYPOINT ["java"]
