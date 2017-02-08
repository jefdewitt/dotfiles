#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT to local projects root directory."}
dev_vm_dir="${VM_PROJECT_LOCATION:-$DEV_PROJECTS_ROOT/dev_vm}"

if cd "$dev_vm_dir/vagrant_web";
then 
    vagrant destroy --force
fi