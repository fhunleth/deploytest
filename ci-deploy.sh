#!/bin/sh

# Check if we're building under Travis-ci
if [ $TRAVIS = true ]; then
    if [ $TRAVIS_TAG ]; then
        BRANCH_OR_TAG=$TRAVIS_TAG
    else
        BRANCH_OR_TAG=$TRAVIS_BRANCH
    fi
fi

BRANCH_OR_TAG=$(git describe --exact-match 2>/dev/null || git rev-parse --abbrev-ref HEAD)
SYSTEM_ARCHIVE_NAME=deploytest-$BRANCH_OR_TAG

mkdir artifacts
cp README.md artifacts/$SYSTEM_ARCHIVE_NAME.txt
