FROM ajchemist/alpine:3.6
MAINTAINER aJchemist "ajchemist@turingmind.com"

ARG ORACLE_JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz

RUN apk add --no-cache --update wget \
    && cd /tmp \
    && wget -O jdk8.tar.gz \
       --no-check-certificate \
       --header "Cookie: oraclelicense=accept-securebackup-cookie" \
       ${ORACLE_JDK_URL} \
    && mkdir -p /opt \
    && tar xzf jdk8.tar.gz -C /opt \
    && mv /opt/jdk* /opt/java \
    && rm /tmp/jdk8.tar.gz \
    && install /opt/java/bin/java /usr/bin/java \
    && install /opt/java/bin/javac /usr/bin/javac

ENV JAVA_HOME /opt/java

ENTRYPOINT ["/usr/bin/java"]
