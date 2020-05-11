#! /usr/bin/env bash

# docker build --tag python-shortcut:latest -f Dockerfile.shortcut .
docker build --tag python-shortcut-alpine:latest -f Dockerfile.shortcut.alpine .
