FROM node:10.15.3-alpine


LABEL maintainer "aJchemist <valchemist@me.com>"


RUN apk add --no-cache --update \
    chromium \
    nss \
    harfbuzz \
    freetype \
    ttf-freefont \
    && rm -rf /var/cache/apk/*
