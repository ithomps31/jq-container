#!/bin/env bash

REPO_NAME="quay.io/plebs_inc/jq"
IMAGE_NAME="latest"

buildah build --tag ${REPO_NAME}:${IMAGE_NAME} -f Containerfile
