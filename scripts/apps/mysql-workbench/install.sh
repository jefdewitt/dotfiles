#!/bin/sh 

# http://download.virtualbox.org/virtualbox/5.0.26/VirtualBox-5.0.26-108824-OSX.dmg

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"

$scripts_directory/helpers/install-dmg-from-command-line.sh https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.9-osx-x86_64.dmg "MySQL Workbench 6.3.9.CE"
