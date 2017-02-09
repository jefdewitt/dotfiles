#!/bin/sh

# intended to be executed on dev02
# from: https://github.cdinteractive.com/michael-large/general-dev-notes/blob/master/notes/projects/boss-dev02.md

cd ~/

rm -rf boss 

git clone https://github.cdinteractive.com/iGaming/boss.git

cd ~/boss/boss-client 

/usr/bin/npm install 

bower install