FROM nginx:stable


LABEL maintainer="aJchemist <1694505+aJchemist@users.noreply.github.com>"


ENV DEBIAN_FRONTEND noninteractive


COPY nginx.conf /etc/nginx/nginx.conf


RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    && date


RUN apt-get update \
    && apt-get install -y curl locales \
    && dpkg-reconfigure locales \
    && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8


RUN apt-get install -y apache2-utils


ENV LANG     C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL   C.UTF-8
