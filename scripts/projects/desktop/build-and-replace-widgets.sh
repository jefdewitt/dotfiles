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
tsui_dir="$DEV_PROJECTS_ROOT/tsui"
dev_vm_dir="$DEV_PROJECTS_ROOT/dev_vm"

vm_script_to_run="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects/desktop/vm-replace-widgets.sh"

echo "building tsui on the host"
cd "$tsui_dir"
grunt

echo "giving the vm the business"
ssh vagrant@127.0.0.1 \
  -p 2222 -o Compression=yes -o DSAAuthentication=yes -o LogLevel=FATAL \
  -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
  -i $dev_vm_dir/vagrant_web/.vagrant/machines/default/virtualbox/private_key \
  "sudo -i" < "$vm_script_to_run"

echo "Ding! Fries are done!"
