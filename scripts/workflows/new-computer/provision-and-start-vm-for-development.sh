#!/bin/sh

#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"
dev_vm_directory="${VM_PROJECT_LOCATION:-$DEV_PROJECTS_ROOT/dev_vm}"

now=$(date +"%Y_%m_%d_%S") # ex: 2017_01_05_44

initial_file="$dev_vm_directory/vagrant_web/Vagrantfile"
replacement_file="$scripts_directory/projects/dev_vm/Vagrantfile-mobile-dev"

# cheap way of persisting previous version of vagrantfile (better than blowing it away completely)
cp -Rf "$initial_file" "$initial_file-$now"

cp -f "$replacement_file" "$initial_file"

mkdir -p "$projects_root/mobile/dist"
mkdir -p "$projects_root/tux/dist"

cd "$dev_vm_web_dir"
CODE_LOCATION=$DEV_PROJECTS_ROOT vagrant up