FROM ajchemist/openjdk:8u162-slim
MAINTAINER aJchemist "ajchemist@turingmind.com"

# http://clojure.org/community/downloads

ARG LINUX_INSTALL_SCRIPT=linux-install-1.9.0.358.sh

RUN apt-get update \
    && apt-get install -y --no-install-recommends rlwrap curl \
    && apt-get clean

RUN curl -O https://download.clojure.org/install/$LINUX_INSTALL_SCRIPT \
    && chmod +x $LINUX_INSTALL_SCRIPT \
    && ./$LINUX_INSTALL_SCRIPT \
    && rm $LINUX_INSTALL_SCRIPT

ENTRYPOINT ["clojure"]
