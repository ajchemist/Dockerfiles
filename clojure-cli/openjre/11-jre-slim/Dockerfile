FROM openjdk:11-jre-slim


LABEL maintainer "aJchemist <valchemist@me.com>"


ARG LINUX_INSTALL_SCRIPT_URL=https://download.clojure.org/install/linux-install-1.10.1.561.sh
# http://clojure.org/community/downloads


RUN apt-get update \
    && apt-get install -y --no-install-recommends rlwrap curl \
    && apt-get clean


RUN curl -o linux-install.sh $LINUX_INSTALL_SCRIPT_URL \
    && chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh


ENTRYPOINT ["clojure"]
