#!/bin/sh

# HOW TO USE: https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/new-computer/ReadMe.md

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_directory="$DEV_PROJECTS_ROOT"
scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"
workflows_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/workflows"

# make our projects directory if it doesn't exist 
mkdir -p "$projects_directory"

# install development tooling 
"$scripts_directory"/apps/homebrew/install.sh
"$scripts_directory"/apps/intellij-idea/install.sh
"$scripts_directory"/apps/google-chrome/install.sh
"$scripts_directory"/apps/mozilla-firefox/install.sh
"$scripts_directory"/apps/n/install.sh
"$scripts_directory"/apps/node-version-we-use/install.sh
"$scripts_directory"/apps/grunt-cli/install.sh
"$scripts_directory"/apps/xcode-command-line-tools/install.scpt
"$scripts_directory"/apps/virtualbox/install.sh
"$scripts_directory"/apps/vagrant/install.sh

# get the repos 
cd "$projects_directory"
git clone -b production https://github.cdinteractive.com/twinspires/dev_vm.git
git clone -b production https://github.cdinteractive.com/twinspires/tsui.git
git clone -b production https://github.cdinteractive.com/twinspires/tux.git
git clone -b production https://github.cdinteractive.com/twinspires/mobile.git
git clone -b production https://github.cdinteractive.com/twinspires/whiteLabel.git
git clone -b production https://github.cdinteractive.com/twinspires/Drupal_Adw.git

# bootstrap the for development 
"$workflows_directory"/new-computer/setup-host-file.sh
"$workflows_directory"/new-computer/provision-and-start-vm-for-development.sh
# $workflows_directory/new-computer/setup-android-dev-tooling.sh
