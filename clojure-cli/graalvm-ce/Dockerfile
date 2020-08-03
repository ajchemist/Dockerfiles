FROM docker.pkg.github.com/graalvm/container/community:ol8-java11-20.1.0


LABEL maintainer "ajchemist <valchemist@me.com>"


# http://clojure.org/community/downloads
ARG LINUX_INSTALL_SCRIPT_URL=https://download.clojure.org/install/linux-install-1.10.1.561.sh


RUN curl -o linux-install.sh $LINUX_INSTALL_SCRIPT_URL \
    && chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh


ENTRYPOINT ["clojure"]
