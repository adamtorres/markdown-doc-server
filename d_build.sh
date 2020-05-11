#! /usr/bin/env bash
GITREPO=$1
if [[ -z "$GITREPO" ]]; then
    echo "Must pass in the github user/repo."
    echo "  Ex: $0 adamtorres/markdown-doc-server"
    exit 9999
fi

IMAGE="${GITREPO#*"/"}-docs"
docker build --tag ${IMAGE}:latest --build-arg GITREPO="$GITREPO" -f Dockerfile  .
echo "The image name is '${IMAGE}'"
