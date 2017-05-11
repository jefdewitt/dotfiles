#!/usr/bin/env bash

# pending for: build, code-quality, test

org="cj-taylor"
repo="tsui"
commit="be256fb693a53b575d0361c05d8112f56026f356"
target_url="https://github.cdinteractive.com/cj-taylor/tsui/issues/1"

../add-status-to-commit.sh $org $repo $commit "Build" "pending" "Build tool" $target_url
../add-status-to-commit.sh $org $repo $commit "Test" "pending" "Build tool" $target_url