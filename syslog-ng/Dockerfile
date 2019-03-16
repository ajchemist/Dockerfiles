FROM alpine:3.9


LABEL maintainer "aJchemist <valchemist@me.com>"
LABEL syslog-version "3.19.1-r0"


RUN apk add --update --no-cache syslog-ng
RUN ln -fsv /var/log/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf


EXPOSE 514/tcp 514/udp


CMD ["/usr/sbin/syslog-ng", "-F"]
