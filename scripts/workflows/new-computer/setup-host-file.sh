#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"
dev_vm_dir="${VM_PROJECT_LOCATION:-$projects_root/dev_vm}"

now=$(date +"%Y_%m_%d_%S") # ex: 2017_01_05_44

# 1. host file manipulations
hosts_file="/etc/hosts"
bootstrapped_hosts_file="$scripts_directory/projects/misc/host"

echo "password required - backing up current hosts file"
sudo cp -f "$hosts_file" "$hosts_file-$now"

# copy boostrapped hosts file into place
echo "copying boostrapped hosts file into place"
cd "${cwd}"
sudo cp -f "$bootstrapped_hosts_file" "$hosts_file"

# https://code.google.com/archive/p/fire-hostadmin/wikis/GAIN_HOSTS_WRITE_PERM.wiki
echo "changing permissions to host file to copy into place bootstrapped host file"
sudo chmod og+w "$hosts_file"