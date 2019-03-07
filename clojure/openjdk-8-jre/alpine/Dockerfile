FROM openjdk:8u191-alpine3.9
LABEL maintainer "aJchemist <valchemist@me.com>"
# http://clojure.org/community/downloads


ARG LINUX_INSTALL_SCRIPT_URL=https://download.clojure.org/install/linux-install-1.10.0.414.sh


RUN apk add --no-cache --update bash openssl curl \
    && rm -rf /var/cache/apk/*


RUN curl -o linux-install.sh $LINUX_INSTALL_SCRIPT_URL \
    && chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh


ENTRYPOINT ["clojure"]
