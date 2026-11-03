#!/bin/env bash

CONTAINER_BINARY="docker"
REPO_NAME="quay.io/plebs_inc/jq"
IMAGE_NAME="binary"


${CONTAINER_BINARY} run --rm -it ${REPO_NAME}:${IMAGE_NAME}
