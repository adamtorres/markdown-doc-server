#! /usr/bin/env sh

if [[ -z "$1" ]]; then
    echo "Build arg not set.  Need to pass in 'user/repo'."
    exit 9999
fi
if [[ "$1" == *"GITREPO"* ]]; then
    echo "Build arg not set.  Need to pass in 'user/repo'."
    exit 9999
fi

if [[ ! -d "code" ]]; then
    mkdir code
fi
cd code
if [[ -f "readme.md" ]]; then
    echo "refreshing repo"
    git pull
    echo "git pull returned '$?'"
    # pull returns 0 regardless if there were changes.
    # Might have to search output for "Already up to date".
else
    echo "cloning https://github.com/$1.git"
    git clone https://github.com/$1.git .
fi
cd docs
markdownserver
