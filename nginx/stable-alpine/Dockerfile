FROM nginx:stable-alpine


LABEL maintainer="aJchemist <1694505+aJchemist@users.noreply.github.com>"


COPY nginx.conf /etc/nginx/nginx.conf


# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk add --no-cache --update curl tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo Asia/Seoul > /etc/timezone \
    && apk del tzdata
