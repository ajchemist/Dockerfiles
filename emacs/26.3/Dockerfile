FROM ajchemist/alpine:3.11-openssh
LABEL maintainer "aJchemist <valchemist@me.com>"


RUN apk add --update --no-cache \
    xz \
    git \
    emacs-nox


COPY emacs_daemon_entry.sh /
RUN chmod +x /emacs_daemon_entry.sh


WORKDIR /root
ENTRYPOINT ["emacs"]
