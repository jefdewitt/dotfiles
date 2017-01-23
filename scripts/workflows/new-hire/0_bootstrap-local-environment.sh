#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_directory="$DEV_PROJECTS_ROOT"
scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"

# install development tooling 
$scripts_directory/apps/homebrew/install.sh
$scripts_directory/apps/intellij-idea/install.sh
$scripts_directory/apps/google-chrome/install.sh
$scripts_directory/apps/mozilla-firefox/install.sh
$scripts_directory/apps/n/install.sh
$scripts_directory/apps/node-version-we-use/install.sh
$scripts_directory/apps/grunt-cli/install.sh

# todo: 
    # xcode-tools 
    # virtualbox 
    # vagrant 

# get the repos 
cd $DEV_PROJECTS_ROOT
git clone https://github.cdinteractive.com/twinspires/dev_vm.git
git clone https://github.cdinteractive.com/twinspires/tsui.git
git clone https://github.cdinteractive.com/twinspires/tux.git
git clone https://github.cdinteractive.com/twinspires/mobile.git
git clone https://github.cdinteractive.com/twinspires/whiteLabel.git
git clone https://github.cdinteractive.com/twinspires/Drupal_Adw.git

# bootstrap the vm 
