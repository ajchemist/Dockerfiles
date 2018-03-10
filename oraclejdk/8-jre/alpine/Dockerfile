FROM ajchemist/alpine:3.7
MAINTAINER aJchemist "ajchemist@turingmind.com"

ARG ORACLE_JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/server-jre-8u162-linux-x64.tar.gz

RUN apk add --no-cache --update wget \
    && cd /tmp \
    && wget -q -O jdk8.tar.gz \
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
