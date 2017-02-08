#!/bin/sh

################################
# "Desktop Dev - Build and Replace Widgets"
#
# "What does this do?"
# 1. Builds tsui on the host machine
# 2. SSHs into local dev_vm
# 3. Excecutes whiteLabel + tsui related build scripts
#
################################

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

host_projects_root=$DEV_PROJECTS_ROOT
project_scripts="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"

time $project_scripts/dev_vm/dev-vm-ssh-and-run-script.sh $project_scripts/tsui/deploy-in-vm.sh