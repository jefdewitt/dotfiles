#!/bin/sh

# https://github.com/adobe/brackets/releases/download/release-1.9/Brackets.Release.1.9.dmg

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"

$scripts_directory/helpers/install-dmg-from-command-line.sh https://github.com/adobe/brackets/releases/download/release-1.9/Brackets.Release.1.9.dmg brackets