FROM alpine:3.9


LABEL maintainer "aJchemist <valchemist@me.com>"


RUN apk add --no-cache --update \
    chromium \
    nss \
    harfbuzz \
    freetype \
    ttf-freefont \
    && rm -rf /var/cache/apk/*
