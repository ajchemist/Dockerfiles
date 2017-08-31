FROM ajchemist/openjdk:8u141-slim
MAINTAINER aJchemist "valchemist@me.com"

# https://github.com/Quantisan/docker-clojure/blob/master/debian/lein/Dockerfile

ARG LEIN_VERSION
ARG LEIN_INSTALL=/usr/local/bin
ENV LEIN_VERSION ${LEIN_VERSION}
ENV LEIN_INSTALL ${LEIN_INSTALL}

# Download the whole repo as an archive
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget gnupg dirmngr

RUN mkdir -p $LEIN_INSTALL \
    && cd /tmp \
    && wget -q https://github.com/technomancy/leiningen/archive/$LEIN_VERSION.tar.gz \
    && echo "Comparing archive checksum ..." \
    && echo "876221e884780c865c2ce5c9aa5675a7cae9f215 *$LEIN_VERSION.tar.gz" | sha1sum -c - \
    && mkdir ./leiningen \
    && tar -xzf $LEIN_VERSION.tar.gz  -C ./leiningen/ --strip-components=1 \
    && mv leiningen/bin/lein-pkg $LEIN_INSTALL/lein \
    && rm -rf $LEIN_VERSION.tar.gz ./leiningen \
    && chmod 0755 $LEIN_INSTALL/lein \

    # Download and verify Lein stand-alone jar
    && wget -q https://github.com/technomancy/leiningen/releases/download/$LEIN_VERSION/leiningen-$LEIN_VERSION-standalone.zip \
    && wget -q https://github.com/technomancy/leiningen/releases/download/$LEIN_VERSION/leiningen-$LEIN_VERSION-standalone.zip.asc \

    && gpg --keyserver pool.sks-keyservers.net --recv-key 2E708FB2FCECA07FF8184E275A92E04305696D78 \
    && echo "Verifying Jar file signature ..." \
    && gpg --verify leiningen-$LEIN_VERSION-standalone.zip.asc \

    # Put the jar where lein script expects
    && rm leiningen-$LEIN_VERSION-standalone.zip.asc \
    && mkdir -p /usr/share/java \
    && mv leiningen-$LEIN_VERSION-standalone.zip /usr/share/java/leiningen-$LEIN_VERSION-standalone.jar

ENV PATH=$PATH:$LEIN_INSTALL

ENV LEIN_HOME /lein
ENV LEIN_ROOT 1

RUN lein
ENTRYPOINT ["lein"]
