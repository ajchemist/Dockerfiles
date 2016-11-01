FROM ajchemist/ubuntu:xenial
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN apt-get update \
    && apt-get install -y git-core subversion build-essential gcc-multilib libssl-dev libncurses5-dev unzip gawk gettext wget file python \
    && apt-get clean

RUN useradd -m openwrt
RUN mkdir -p /etc/sudoers.d \
    && echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt
