#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_directory="$DEV_PROJECTS_ROOT"
scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"

# build widget in tsui
$scripts_directory/styleguide/build.sh

# replace in tux 
$scripts_directory/styleguide/copy-to-tux.sh   

# build tux 
$scripts_directory/tux/build.sh
