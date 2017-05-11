#!/usr/bin/env bash

# 2.2.1 Build: Success, Test: Failure, Approval: Pending

org="cj-taylor"
repo="tsui"
commit="b149e65b427b96267ace920ba8b6552e6449860b"
target_url="https://github.cdinteractive.com/cj-taylor/tsui/issues/3"

../add-status-to-commit.sh $org $repo $commit "Build" "success" "Build tool" $target_url
../add-status-to-commit.sh $org $repo $commit "Test" "success" "Build tool" $target_url