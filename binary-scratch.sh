#!/bin/env bash

# ENV Vars
IMAGE_NAME="binary"
REPO_NAME="quay.io/plebs_inc/jq"
EX_FILE="example.json"
JQ_BIN_LOC"/home/ithomp37/sources/jq/jq"

# Scratch setup
jq_container=$(buildah from scratch)
scratchmnt=$(buildah mount $jq_container)

# Remove artifacts at exit
cleanup() {
    buildah umount "$jq_container" >/dev/null 2>&1 || true
}
trap cleanup EXIT

# Add example file and set entrypoint
buildah copy $jq_container ./${EX_FILE} /app/${EX_FILE}
buildah copy $jq_container ${JQ_BIN_LOC} /usr/bin/

# buildah config --entrypoint '/usr/bin/bash' $jq_container
buildah config --entrypoint '["/usr/bin/jq", ".", "/app/example.json"]' "$jq_container"

# Save jq image
buildah commit $jq_container ${REPO_NAME}:${IMAGE_NAME}
