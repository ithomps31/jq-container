#!/bin/env bash

IMAGE_NAME="minimal"

# buildah push quay.io/plebs_inc/jq:latest
buildah push quay.io/plebs_inc/jq:${IMAGE_NAME}
