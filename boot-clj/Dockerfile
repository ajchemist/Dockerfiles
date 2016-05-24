FROM ajchemist/java:openjdk-8-jre
MAINTAINER aJchemist <valchemist@me.com>

RUN curl -Lo /usr/local/bin/boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh; \
    chmod +x /usr/local/bin/boot;

COPY profile.boot boot.properties /.boot/

ENV BOOT_HOME /.boot
ENV BOOT_AS_ROOT yes
ENV BOOT_LOCAL_REPO /.m2
ENV BOOT_JVM_OPTIONS "-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xmx4g -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xverify:none"
ENV BOOT_EMIT_TARGET no

VOLUME ["/project"]
WORKDIR /project

ENTRYPOINT ["/usr/local/bin/boot"]
