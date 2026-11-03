#!/bin/env bash

# ENV Vars
REPO_NAME="quay.io/plebs_inc/jq"
IMAGE_NAME="minimal"
EX_FILE="example.json"

# Scratch setup
jq_container=$(buildah from scratch)
scratchmnt=$(buildah mount $jq_container)

# Remove artifacts at exit
cleanup() {
    buildah umount "$jq_container" >/dev/null 2>&1 || true
}
trap cleanup EXIT

# Install jq
dnf -y --installroot $scratchmnt \
    --disablerepo=* \
    --enablerepo=rhel-9-for-x86_64-baseos-rpms \
    --releasever 9 \
    --setopt install_weak_deps=false \
    --setopt=tsflags=nodocs \
    install jq

# Cache removal
dnf --installroot $scratchmnt clean all && rm -rf /var/cache/dnf
rm -rf "$scratchmnt"/var/cache/dnf \
       "$scratchmnt"/var/log/dnf* \
       "$scratchmnt"/var/log/hawkey*


# Add example file and set entrypoint
buildah copy $jq_container ./${EX_FILE} /app/${EX_FILE}
buildah config --entrypoint '/usr/bin/bash' $jq_container

# Save jq image
buildah commit $jq_container ${REPO_NAME}:${IMAGE_NAME}
