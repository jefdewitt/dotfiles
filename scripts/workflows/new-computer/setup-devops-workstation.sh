#!/bin/sh

projects_directory="$DEV_PROJECTS_ROOT"
scripts_directory="$projects_directory/dotfiles/scripts"

"$scripts_directory"/apps/sdkman/install.sh
"$scripts_directory"/apps/docker/install.sh
