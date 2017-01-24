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

# echo "building tsui on the host"
# time $project_scripts/tsui/build.sh

# echo "Building whitelabel on the vm"
# time $project_scripts/dev_vm/dev-vm-ssh-and-run-script.sh $project_scripts/whiteLabel/build-in-vm.sh

echo "Deploying TSUI on the VM for desktop"
time $project_scripts/dev_vm/dev-vm-ssh-and-run-script.sh $project_scripts/tsui/deploy-in-vm.sh

echo "All done, you should now see your changes on local desktop site!"