#! /usr/bin/env bash
GITREPO=$1
if [[ -z "$GITREPO" ]]; then
    echo "Must pass in the github user/repo."
    echo "  Ex: $0 adamtorres/markdown-doc-server"
    exit 9999
fi
docker build --tag example-docs:latest --build-arg GITREPO="$GITREPO" -f Dockerfile  .
