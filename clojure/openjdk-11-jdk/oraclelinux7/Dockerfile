FROM openjdk:11.0.2-jdk-oraclelinux7
LABEL maintainer "aJchemist <valchemist@me.com>"
# http://clojure.org/community/downloads


ARG LINUX_INSTALL_SCRIPT_URL=https://download.clojure.org/install/linux-install-1.10.0.411.sh


RUN set -eux; \
    yum install -y rlwrap \
    rm -rf /var/cache/yum


RUN curl -o linux-install.sh $LINUX_INSTALL_SCRIPT_URL \
    && chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh


RUN clojure -e "(clojure-version)"


ENTRYPOINT ["clojure"]
