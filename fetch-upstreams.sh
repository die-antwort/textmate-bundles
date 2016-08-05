#!/usr/bin/env bash

cd ~/Library/Application\ Support/Avian/Bundles || exit 1

git submodule foreach "git remote | grep -q upstream && (git fetch upstream && git log head..upstream/master | cat) || echo 'WARNING: No remote named \"upstream\", skipping!'; echo"

