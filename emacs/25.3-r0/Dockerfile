FROM ajchemist/alpine:3.7-openssh
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN apk add --update --no-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
    xz \
    git \
    emacs-nox

COPY emacs_daemon_entry.sh /emacs_daemon_entry.sh

WORKDIR /root
ENTRYPOINT ["emacs"]
