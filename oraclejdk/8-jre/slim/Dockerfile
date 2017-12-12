FROM ajchemist/debian:stable-slim
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ARG ORACLE_JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/server-jre-8u152-linux-x64.tar.gz

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y curl wget openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && cd /tmp \
    && wget -q -O jdk8.tar.gz \
       --header "Cookie: oraclelicense=accept-securebackup-cookie" \
       ${ORACLE_JDK_URL} \
    && tar xzf jdk8.tar.gz -C /opt \
    && mv /opt/jdk* /opt/java \
    && rm /tmp/jdk8.tar.gz \
    && update-alternatives --install /usr/bin/java java /opt/java/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 100

ENV JAVA_HOME /opt/java

# download & install deps, cache REPL and web deps
# RUN /usr/bin/boot web -s doesnt/exist repl -e '(System/exit 0)' && rm -rf target

VOLUME ["/srv"]
WORKDIR /srv

ENTRYPOINT ["/usr/bin/java"]
