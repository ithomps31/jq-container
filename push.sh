#!/bin/env bash

IMAGE_NAME="minimal"
REPO_NAME="quay.io/plebs_inc/jq"

# buildah push quay.io/plebs_inc/jq:latest
buildah push ${REPO_NAME}:${IMAGE_NAME}
