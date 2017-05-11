#!/usr/bin/env bash

api="https://github.cdinteractive.com/api/v3"
organization=$1
repo=$2
git_commit=$3
access_token="150e8665e7718d72726f1b36f17433974a1148b8"
context=$4
status=$5
description=$6
target_url=$7

curl "$api/repos/$organization/$repo/statuses/$git_commit?access_token=$access_token" \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"context\": \"$context\", \"state\": \"$status\", \"description\": \"$description\", \"target_url\": \"$target_url\"}"
Raw
