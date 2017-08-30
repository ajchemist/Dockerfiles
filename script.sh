#!/bin/bash

self="${BASH_SOURCE[0]}"
selfdir="$(cd "$(dirname "${self}")"; pwd)"
selfpath="$selfdir/$(basename "$self")"

#
# $TRAVIS_BUILD_NUMBER
# $TRAVIS_JOB_ID
# $TRAVIS_JOB_NUMBER

function docker_build()
{
    cd "${RDIR}/${TAG}${VARIANT:+/$VARIANT}"

    REPO="${DOCKER_HUB_USERNAME}/${RDIR}"

    IMAGE="$REPO:travis${COMMIT:+-$COMMIT}${TRAVIS_JOB_NUMBER:+-$TRAVIS_JOB_NUMBER}"

    docker build -t $IMAGE .
    docker tag $IMAGE $REPO:$TAG${VARIANT:+-$VARIANT}
    for _tag in ${TAGS}
    do
        docker tag $IMAGE $REPO:${_tag}${VARIANT:+-$VARIANT}
    done
    if [ ! -z $LATEST ]; then
        LATEST_TAG=$(if [ "$TRAVIS_BRANCH" == "master" ]; then echo latest; else echo $TRAVIS_BRANCH; fi)
        docker tag $IMAGE $REPO:$LATEST_TAG${VARIANT:+-$VARIANT}
    fi
}

function docker_push()
{
    docker push $REPO
}

# * build

echo "******"
echo "******" building...
echo "******"


case $RDIR in
    *)
        docker_build
        ;;
esac

if [ ! $? -eq 0 ]; then
    echo FAILED ON BUILD STAGE
    exit 1;
fi

# * test

echo "******"
echo "******" testing...
echo "******"

case $RDIR in
    oraclejdk)
        docker run --rm -it $IMAGE -version
        ;;
    *)
        ;;
esac


if [ ! $? -eq 0 ]; then
    echo FAILED ON TEST STAGE
    exit 1;
fi

# * push

echo "******"
echo "******" pushing...
echo "******"

case $RDIR in
    *)
        docker_push
        ;;
esac
