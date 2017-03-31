#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

project_scripts="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"

code_location='/mnt/code/cdux-registration/dist/'
http_location='/nas/whiteLabel/webroot/php/newreg/'
https_location='/nas/whiteLabel/webroot-sec/php/newreg/'

# remove contents / copy dist to http location / change perms / change owner 
$project_scripts/dev_vm/dev-vm-ssh-and-run-command.sh "sudo -i bash -c 'rm -Rf $http_location && mkdir -p $http_location && cp -Rf $code_location* $http_location && chmod 755 -R $http_location* && chown netserve.common -R $http_location* && ls -ltr $http_location'"

# remove contents / copy dist to https location / change perms / change owner 
$project_scripts/dev_vm/dev-vm-ssh-and-run-command.sh "sudo -i bash -c 'rm -Rf $https_location && mkdir -p $https_location && cp -Rf $code_location* $https_location && chmod 755 -R $https_location* && chown netserve.common -R $https_location* && ls -ltr $https_location'"
