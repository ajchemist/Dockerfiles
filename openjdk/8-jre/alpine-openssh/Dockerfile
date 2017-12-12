FROM ajchemist/openjdk:8u151-jre-alpine
MAINTAINER aJchemist <ajchemist@turingmind.com>

RUN apk add --update --no-cache bash openssh

COPY authorized_keys /root/.ssh/authorized_keys

RUN mkdir -p /root/.ssh \
    && chmod 700 /root/.ssh \
    && touch /root/.ssh/authorized_keys \
    && chmod 600 /root/.ssh/authorized_keys

COPY bootstrap.sh jre_entry.sh /
RUN chmod +x /bootstrap.sh
RUN /bootstrap.sh

EXPOSE 22

ENTRYPOINT ["/jre_entry.sh"]
