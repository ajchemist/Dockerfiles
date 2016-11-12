FROM ajchemist/debian:jessie
MAINTAINER aJchemist <ajchemist@turingmind.com>

ARG BOOTCLJ_URL=https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh
ARG ORACLE_JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y curl wget openssl ca-certificates \
    && cd /tmp \
    && wget -O jdk8.tar.gz \
       --header "Cookie: oraclelicense=accept-securebackup-cookie" \
       ${ORACLE_JDK_URL} \
    && tar xzf jdk8.tar.gz -C /opt \
    && mv /opt/jdk* /opt/java \
    && rm /tmp/jdk8.tar.gz \
    && update-alternatives --install /usr/bin/java java /opt/java/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 100 \
    && wget -O /usr/bin/boot ${BOOTCLJ_URL} \
    && chmod +x /usr/bin/boot

ENV JAVA_HOME /opt/java

ENV BOOT_AS_ROOT yes
ENV BOOT_EMIT_TARGET no
ENV BOOT_CLOJURE_NAME org.clojure/clojure
ENV BOOT_HOME /.boot
ENV BOOT_LOCAL_REPO /m2/repository
ENV BOOT_JVM_OPTIONS=-Xmx2g

# download & install deps, cache REPL and web deps
# RUN /usr/bin/boot web -s doesnt/exist repl -e '(System/exit 0)' && rm -rf target

ENTRYPOINT ["/usr/bin/boot"]
