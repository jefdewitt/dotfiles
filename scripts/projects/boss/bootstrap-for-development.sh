#!/bin/sh 

# scripting of:  https://github.cdinteractive.com/michael-large/general-dev-notes/blob/master/notes/projects/boss-dev02.md

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT to local projects root directory."}

provisioning_script="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects/boss/dev02-provision-script.sh"

ssh \
dev02.cdinteractive.com \
< "$provisioning_script"