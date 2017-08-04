#!/bin/sh

# HOW TO USE: https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/new-computer/ReadMe.md

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_directory="$DEV_PROJECTS_ROOT"
scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"
workflows_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/workflows"

# make our projects directory if it doesn't exist
mkdir -p "$projects_directory"

"$workflows_directory"/new-computer/setup-churchill-basics.sh
"$workflows_directory"/new-computer/setup-frontend-workstation.sh

declare -a apps=(
    "brackets"
    "boxSync"
)

declare -a repos=(
    "twinspires/cdux-mint-julep"
)

for app in "${apps[@]}"
do
    echo "Installing: $app"
    sh "$scripts_directory"/apps/"$app"/install.sh || {
        echo "Failed to install: $app"
    }
done

# get the repos
cd "$projects_directory"
for repo in "${repos[@]}"
do
    echo "Clonnig: $repo"
    git clone -b production https://github.cdinteractive.com/"$repo".git|| {
        echo "Failed to clone: $app"
    }
done