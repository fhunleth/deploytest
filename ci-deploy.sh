#!/bin/sh

# Check if we're building under Travis-ci
if [ "$TRAVIS" = "true" ]; then
    echo "TAG=$TRAVIS_TAG"
    echo "BRANCH=$TRAVIS_BRANCH"

    if [ -n "$TRAVIS_TAG" ]; then
        BRANCH_OR_TAG=$TRAVIS_TAG
    else
        BRANCH_OR_TAG=$TRAVIS_BRANCH
    fi
else
    BRANCH_OR_TAG=$(git describe --exact-match 2>/dev/null || git rev-parse --abbrev-ref HEAD)
fi

SYSTEM_ARCHIVE_NAME=deploytest-$BRANCH_OR_TAG

rm -fr artifacts
mkdir artifacts
cp README.md artifacts/$SYSTEM_ARCHIVE_NAME.txt
