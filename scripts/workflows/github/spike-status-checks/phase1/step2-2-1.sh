#!/usr/bin/env bash

# 2.2.1 Build: Success, Test: Failure, Approval: Pending

org="cj-taylor"
repo="tsui"
commit="39c3106c1427b86e9482c61c7607f34e3e363abe"
target_url="https://github.cdinteractive.com/cj-taylor/tsui/issues/1"

../add-status-to-commit.sh $org $repo $commit "Build" "success" "Build: Failed" $target_url
../add-status-to-commit.sh $org $repo $commit "Test" "failure" "Unit-Test: pending" $target_url