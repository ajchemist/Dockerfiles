FROM ajchemist/alpine:3.4
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN apk add --update syslog-ng
RUN ln -fsv /var/log/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

VOLUME ["/var/log/syslog-ng", "/var/run/syslog-ng"]

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
