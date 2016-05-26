#!/bin/sh

mkdir -p tmp

docker run -d --name nginx-tmp nginx:stable
docker cp nginx-tmp:/etc/nginx/nginx.conf tmp/nginx.conf
docker stop nginx-tmp && docker rm nginx-tmp

docker run -d --name nginx-tmp nginx:stable-alpine
docker cp nginx-tmp:/etc/nginx/nginx.conf tmp/nginx_alpine.conf
docker stop nginx-tmp && docker rm nginx-tmp
