#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

project_scripts="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"

# copy dist to http location / change perms / change owner 
$project_scripts/dev_vm/dev-vm-ssh-and-run-command.sh "sudo -i bash -c 'yes | cp -Rf /mnt/code/cdux-registration/dist/* /nas/whiteLabel/webroot/php/newreg/ && chmod 755 -R /nas/whiteLabel/webroot/php/newreg/* && chown netserve.common -R /nas/whiteLabel/webroot/php/newreg/*'"

# copy dist to https location / change perms / change owner 
$project_scripts/dev_vm/dev-vm-ssh-and-run-command.sh "sudo -i bash -c 'yes | cp -Rf /mnt/code/cdux-registration/dist/* /nas/whiteLabel/webroot-sec/php/newreg/ && chmod 755 -R /nas/whiteLabel/webroot-sec/php/newreg/* && chown netserve.common -R /nas/whiteLabel/webroot-sec/php/newreg/*'"
