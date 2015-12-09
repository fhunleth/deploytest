#!/bin/sh

BRANCH_OR_TAG=$(git describe --exact-match 2>/dev/null || git rev-parse --abbrev-ref HEAD)
SYSTEM_ARCHIVE_NAME=deploytest-$BRANCH_OR_TAG

mkdir artifacts
cp README.md artifacts/$SYSTEM_ARCHIVE_NAME.txt
