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
    DOCKERFILE_PATH=${DOCKERFILE_PATH:-"${ADIR}/${TAG}${VARIANT:+/$VARIANT}"}
    pushd "$DOCKERFILE_PATH"

    REPO=${REPO:-"${DOCKER_HUB_USERNAME}/${ADIR}"}

    IMAGE="$REPO:travis${COMMIT:+-$COMMIT}${TRAVIS_JOB_NUMBER:+-$TRAVIS_JOB_NUMBER}"

    docker build -t $IMAGE${BUILD_ARGS:+ $BUILD_ARGS} .
    popd

    # tagging
    docker tag $IMAGE $REPO:${TAG_PREFIX:+$TAG_PREFIX-}$TAG${VARIANT:+-$VARIANT}${TAG_SUFFIX:+-$TAG_SUFFIX}
    for _tag in ${TAGS}
    do
        docker tag $IMAGE $REPO:${TAG_PREFIX:+$TAG_PREFIX-}${_tag}${VARIANT:+-$VARIANT}${TAG_SUFFIX:+-$TAG_SUFFIX}
    done
    for _hottag in ${HOTTAGS}
    do
        docker tag $IMAGE $REPO:${_hottag}
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


case $ADIR in
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


case $ADIR in
    oraclejdk)
        docker run --rm -it $IMAGE -version
        ;;
    openjdk)
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


case $ADIR in
    *)
        docker_push
        ;;
esac
