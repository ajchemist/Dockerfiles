FROM ajchemist/openjdk:8u171-alpine
LABEL maintainer "aJchemist <valchemist@me.com>"
# http://clojure.org/community/downloads


ARG LINUX_INSTALL_SCRIPT=linux-install-1.9.0.394.sh


RUN apk add --no-cache --update bash openssl curl \
    && rm -rf /var/cache/apk/*


RUN curl -O https://download.clojure.org/install/$LINUX_INSTALL_SCRIPT \
    && chmod +x $LINUX_INSTALL_SCRIPT \
    && ./$LINUX_INSTALL_SCRIPT \
    && rm $LINUX_INSTALL_SCRIPT


ENTRYPOINT ["clojure"]
