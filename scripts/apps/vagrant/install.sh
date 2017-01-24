#!/bin/sh

# https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5.dmg

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"

$scripts_directory/helpers/install-dmg-from-command-line.sh https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5.dmg Vagrant