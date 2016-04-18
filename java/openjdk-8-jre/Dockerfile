FROM java:openjdk-8-jre
MAINTAINER aJchemist <valchemist@me.com>

RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime; \
    echo Asia/Seoul > /etc/zoneinfo; \
    echo Asia/Seoul > /etc/timezone;

VOLUME ["/deploy"]
WORKDIR /deploy

ENTRYPOINT ["java"]
