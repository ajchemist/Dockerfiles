FROM alpine:3.9


LABEL maintainer "aJchemist <valchemist@me.com>"
LABEL syslog-version "3.19.1-r0"


RUN apk add --update --no-cache syslog-ng


EXPOSE 514/tcp
EXPOSE 514/udp


# -F --foreground
CMD ["/usr/sbin/syslog-ng", "-F"]
