#!/bin/sh

# NOTE: PREREQUIREMENTS
# 1. VirtualBox is installed
# 2. Vagrant is installed
# 3. You have been added to the twinspires github organization
# 4. You have set DEV_PROJECTS_ROOT environment variable
#
# NOTE: this takes awhile, from a timed run: real	10m42.094s
#
# Overview:
#   - puts in place a bootstrapped hosts file for local development
#   - fetches code necessary for the local virtual machine and mobile development
#   - spins up the initial dev_vm

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_root=$DEV_PROJECTS_ROOT

# if ENV VM_PROJECT_LOCATION not set, assign to default
dev_vm_dir="${VM_PROJECT_LOCATION:-$projects_root/dev_vm}"

# TODO: factor this out
# stashing current working directory to know where to look for dependent scripts
cwd=$(pwd)

mkdir -p "$projects_root"

if cd "$projects_root";
then
  # used for cheap backups of existing files
  now=$(date +"%Y_%m_%d_%S") # ex: 2017_01_05_44

  # 1. host file manipulations
    hosts_file="/etc/hosts"
    bootstrapped_hosts_file="../misc/host"

    echo "password required - backing up current hosts file"
    sudo cp -f "$hosts_file" "$hosts_file-$now"

    # copy boostrapped hosts file into place
    echo "copying boostrapped hosts file into place"
    cd "${cwd}"
    sudo cp -f "$bootstrapped_hosts_file" "$hosts_file"

    # https://code.google.com/archive/p/fire-hostadmin/wikis/GAIN_HOSTS_WRITE_PERM.wiki
    echo "changing permissions to host file to copy into place bootstrapped host file"
    sudo chmod og+w "$hosts_file"

  # 2. getting various projects code
    cd "$projects_root"
    echo "Fetching dev_vm source"
    git clone https://github.cdinteractive.com/twinspires/dev_vm.git

    echo "Fetching tsui source"
    git clone https://github.cdinteractive.com/twinspires/tsui.git

    echo "Fetching tux source"
    git clone https://github.cdinteractive.com/twinspires/tux.git

    echo "Fetching mobile source"
    git clone https://github.cdinteractive.com/twinspires/mobile.git

  # 3. Setting up the dev vm
    echo "setting up dev_vm"
    dev_vm_web_dir="$dev_vm_dir/vagrant_web"

    # NOTE: this was taken out as debugging doesn't seem to be needed much
    # echo "creating ~/nas if it doesn't exist for php debugging"
    # mkdir -p "$projects_root/nas"

    # cheap way of persisting previous version of vagrantfile (better than blowing it away completely)
    echo "backing up existing vagrantfile"
    cd "$dev_vm_web_dir"
    cp -f "Vagrantfile" "Vagrantfile-$now"
    echo "removing existing vagrantfile"
    rm -rf "Vagrantfile"

    echo "copying mobile dev altered vagrantfile into place"
    cd "${cwd}"
    altered_vagrantfile_location='../vagrant/Vagrantfile-mobile-dev'
    cp -f "$altered_vagrantfile_location" "$dev_vm_web_dir/Vagrantfile"

    echo "creating missing directories for vagrant to startup"
    mkdir -p "$projects_root/mobile/dist"
    mkdir -p "$projects_root/tux/dist"

    echo "Spinning up a fresh dev_vm"
    cd "$dev_vm_web_dir"
    CODE_LOCATION=$projects_root vagrant up
fi
