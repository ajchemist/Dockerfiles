FROM java:openjdk-9-jre
MAINTAINER aJchemist <valchemist@me.com>

RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime; \
    echo Asia/Seoul > /etc/zoneinfo;

VOLUME ["/deploy"]
WORKDIR /deploy

ENTRYPOINT ["java"]
