#!/bin/sh

echo "............................................................"
docker build -t ajchemist/nginx:stable        stable

echo "............................................................"
docker build -t ajchemist/nginx:stable-alpine stable-alpine

echo "............................................................"
docker build -t ajchemist/nginx:basic -f basic/Dockerfile .

echo "............................................................"
docker build -t ajchemist/nginx:basic-alpine -f basic-alpine/Dockerfile .
