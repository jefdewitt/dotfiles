#!/bin/sh

# http://brew.sh/
if ! [ -x "$(command -v brew)" ];
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi