#!/bin/env bash

IMAGE_NAME="binary"

# podman run --rm -it quay.io/plebs_inc/jq:latest

docker run --rm -it quay.io/plebs_inc/jq:${IMAGE_NAME}
