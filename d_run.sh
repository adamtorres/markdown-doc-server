#! /usr/bin/env bash
GITREPO=$1
if [[ -z "$GITREPO" ]]; then
    echo "Must pass in the github user/repo."
    echo "  Ex: $0 adamtorres/markdown-doc-server"
    exit 9999
fi

IMAGE="${GITREPO#*"/"}-docs"

if [ ! "$(docker ps -a | grep ${IMAGE})" ]; then
    docker run -p 127.0.0.1:8009:8009/tcp --name $IMAGE $IMAGE
else
    docker start --attach $IMAGE
fi
