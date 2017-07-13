#!/usr/bin/env bash

# https://storage.googleapis.com/golang/go1.8.3.darwin-amd64.pkg

brew install golang

which go &> /dev/null || (echo "go install failed" && exit 1)

go get github.com/tools/godep

which godep &> /dev/null || (echo "godep install failed" && exit 1)
