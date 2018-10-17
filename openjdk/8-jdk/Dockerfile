FROM openjdk:8-jdk
LABEL maintainer "aJchemist <valchemist@me.com>"


RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/zoneinfo \
    && echo Asia/Seoul > /etc/timezone;


VOLUME ["/srv"]
WORKDIR /srv


ENTRYPOINT ["java"]
