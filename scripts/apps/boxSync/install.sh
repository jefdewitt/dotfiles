#!/bin/sh

# https://sites.box.com/sync4/
# https://e3.boxcdn.net/box-installers/sync/Sync+4+External/Box%20Sync%20Installer.dmg

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"

$scripts_directory/helpers/install-dmg-from-command-line.sh https://e3.boxcdn.net/box-installers/sync/Sync+4+External/Box%20Sync%20Installer.dmg