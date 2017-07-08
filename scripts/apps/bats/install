#!/usr/bin/env bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

cd "$DEV_PROJECTS_ROOT"
git clone https://github.com/sstephenson/bats.git
cd bats
sudo ./install.sh /usr/local

which bats &> /dev/null || (echo "bats install not successful" && exit 1)

echo "bats install successful"
