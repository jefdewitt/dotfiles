#!/bin/sh

# from https://blog.lucascantor.com/install-xcode-command-line-tools-from-the-command-line-dfaab9969fb0#.oxsbhxzas
# todo: test this out 

touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
PROD=$(softwareupdate -l |
    grep “\*.*Command Line” |
    head -n 1 | awk -F”*” ‘{print $2}’ |
    sed -e ‘s/^ *//’ |
    tr -d ‘\n’)
softwareupdate -i “$PROD” -v