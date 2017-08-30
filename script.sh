#!/bin/bash

self="${BASH_SOURCE[0]}"
selfdir="$(cd "$(dirname "${self}")"; pwd)"
selfpath="$selfdir/$(basename "$self")"

function docker_build()
{
    cd "${RDIR}/${TAG}${VARIANT:+/$VARIANT}"

    REPO="${DOCKER_HUB_USERNAME}/${RDIR}"

    docker build -t $REPO:$COMMIT .
    docker tag $REPO:$COMMIT $REPO:travis${TRAVIS_BUILD_NUMBER:+-$TRAVIS_BUILD_NUMBER}
    docker tag $REPO:$COMMIT $REPO:$TAG${VARIANT:+-$VARIANT}
    for _tag in ${TAGS[@]}
    do
        docker tag $REPO:$COMMIT $REPO:$_tag${VARIANT:+-$VARIANT}
    done
    if [ ! -z $LATEST ]; then
        LATEST_TAG=$(if [ "$TRAVIS_BRANCH" == "master" ]; then echo latest; else echo $TRAVIS_BRANCH; fi)
        docker tag $REPO:$COMMIT $REPO:$LATEST_TAG${VARIANT:+-$VARIANT}
    fi
}

function docker_push()
{
    docker push $REPO
}

# * build

case $RDIR in
    alpine)
        docker_build
        VARIANT=openssh docker_build
        ;;
    *)
        docker_build
        ;;
esac

if [ ! $? -eq 0 ]; then
    echo FAILED ON BUILD STAGE
    exit 1;
fi

# * test

case $RDIR in
    oraclejdk)
        docker run --rm -it $REPO:$COMMIT -version
        ;;
    *)
        ;;
esac


if [ ! $? -eq 0 ]; then
    echo FAILED ON TEST STAGE
    exit 1;
fi

# * push

case $RDIR in
    *)
        docker_push
        ;;
esac
