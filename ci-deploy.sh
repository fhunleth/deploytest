#!/bin/sh

# Check if we're building under Travis-ci
if [ "$TRAVIS" = "true" ]; then
    if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
        echo "Not supposed to be deploying pull requests!!"
        exit 1
    fi

    if [ -n "$TRAVIS_TAG" ]; then
        BRANCH_OR_TAG=$TRAVIS_TAG
    else
        BRANCH_OR_TAG=$TRAVIS_BRANCH
    fi
else
    # Use git to figure out the branch or tag. This doesn't
    # work on Travis due to how it clones the builds.
    BRANCH_OR_TAG=$(git describe --exact-match 2>/dev/null || git rev-parse --abbrev-ref HEAD)
fi

SYSTEM_ARCHIVE_NAME=deploytest-$BRANCH_OR_TAG

rm -fr artifacts
mkdir artifacts
cp build-product.txt artifacts/$SYSTEM_ARCHIVE_NAME.txt
