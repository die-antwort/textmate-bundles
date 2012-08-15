#!/usr/bin/env bash

cd ~/Library/Application\ Support/Avian/Bundles || exit 1

git submodule foreach "git fetch upstream && git log head..upstream/master | cat && echo"

