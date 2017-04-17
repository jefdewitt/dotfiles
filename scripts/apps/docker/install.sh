#!/bin/sh

# https://download.docker.com/mac/stable/Docker.dmg

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"

$scripts_directory/helpers/install-dmg-from-command-line.sh https://download.docker.com/mac/stable/Docker.dmg docker