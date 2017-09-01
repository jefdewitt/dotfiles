#!/usr/bin/env bash

# download via https://www.packer.io/downloads.html
curl --http1.1 https://releases.hashicorp.com/packer/1.0.3/packer_1.0.3_darwin_amd64.zip --output ~/Downloads/packer_1.0.3_darwin_amd64.zip

# extract zip
# mv packer executable to /usr/local
# mkdir -p $DEV_PROJECTS_ROOT/packer
# mv ~/Downloads/packer_1.0.3_darwin_amd64.zip $DEV_PROJECTS_ROOT/packer/packer
# chown $USER $DEV_PROJECTS_ROOT/packer/packer

# $DEV_PROJECTS_ROOT/packer/packer

# update dotfiles to inlude /usr/local/packer:$PATH in pathmm