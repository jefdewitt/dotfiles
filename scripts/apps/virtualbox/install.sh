#!/bin/sh

# http://download.virtualbox.org/virtualbox/5.0.26/VirtualBox-5.0.26-108824-OSX.dmg

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"

which vboxmanage || {
    $scripts_directory/helpers/install-dmg-from-command-line.sh http://download.virtualbox.org/virtualbox/5.0.26/VirtualBox-5.0.26-108824-OSX.dmg VirtualBox
}