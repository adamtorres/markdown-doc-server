#! /usr/bin/env bash

if [ ! "$(docker ps -a | grep example-docs)" ]; then
    docker run -p 127.0.0.1:8009:8009/tcp --name example-docs example-docs
else
    docker start --attach example-docs
fi
