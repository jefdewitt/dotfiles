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

vm_script_to_run="$project_scripts/desktop/vm-replace-widgets.sh"

echo "building tsui on the host"
$project_scripts/tsui/build.sh

echo "Replacing widgets on the vm"
$project_scripts/dev_vm/dev-vm-ssh-and-run-script.sh $vm_script_to_run

echo "All done, you should now see your changes on local desktop site!"
