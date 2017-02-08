#!/bin/sh

################################
#
# "What does this do?"
# 1. SSHs into local dev_vm
# 2. Builds phpWebServices
#
################################

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

host_projects_root=$DEV_PROJECTS_ROOT
project_scripts="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"

time $project_scripts/dev_vm/dev-vm-ssh-and-run-script.sh $project_scripts/phpWebServices/build-in-vm.sh

