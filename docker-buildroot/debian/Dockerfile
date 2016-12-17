FROM ajchemist/debian:jessie
MAINTAINER aJchemist <ajchemist@turingmind.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get -y install \
       git \
       make \
       build-essential \
       curl \
       wget \
       genisoimage \
       liblzma-dev \
       binutils-dev \
       zlib1g-dev \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/buildroot"]
WORKDIR /buildroot
