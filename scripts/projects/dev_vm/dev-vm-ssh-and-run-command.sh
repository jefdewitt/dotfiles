#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT to local projects root directory."}

dev_vm_dir="${VM_PROJECT_LOCATION:-$DEV_PROJECTS_ROOT/dev_vm/vagrant_web}"

if [ -n "$1" ]; 
then 
    echo "Attempting to execute on dev_vm: $1"

    ssh vagrant@127.0.0.1 \
    -p 2222 -o Compression=yes -o DSAAuthentication=yes -o LogLevel=FATAL \
    -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
    -i $dev_vm_dir/.vagrant/machines/default/virtualbox/private_key \
    "$1"

else 
    echo "Parameter for full path to script required."
fi