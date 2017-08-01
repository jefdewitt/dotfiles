#!/usr/bin/env sh

# HOW TO USE: https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/new-computer/ReadMe.md

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_directory="$DEV_PROJECTS_ROOT"
scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"
workflows_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/workflows"

# make our projects directory if it doesn't exist
mkdir -p "$projects_directory"

"$workflows_directory"/new-computer/setup-churchill-basics.sh

# install development tooling
declare -a apps=(
    "intellij-idea"
    "n"
    "node-version-we-use"
    "grunt-cli"
    "xcode-command-line-tools"
    "virtualbox"
    "vagrant"
    "postman"
)

for app in "${apps[@]}"
do
    echo "Installing: $app"
    sh "$scripts_directory"/apps/"$app"/install.sh || {
        echo "Failed to install: $app"
    }
done

# get the repos
mkdir -p "$projects_directory"
cd "$projects_directory"

declare -a repos=(
    "twinspires/dev_vm"
    "twinspires/tsui"
    "twinspires/tux"
    "twinspires/cdux-mobile"
    "twinspires/whiteLabel"
    "twinspires/Drupal_Adw"
    "twinspires/cdux-ng"
    "twinspires/cdux-races"
)

for repo in "${repos[@]}"
do
    echo "Clonnig: $repo"
    git clone -b production https://github.cdinteractive.com/"$repo".git|| {
        echo "Failed to clone: $app"
    }
done

# bootstrap the for development
"$workflows_directory"/new-computer/setup-host-file.sh
"$workflows_directory"/new-computer/provision-and-start-vm-for-development.sh
# $workflows_directory/new-computer/setup-android-dev-tooling.sh
