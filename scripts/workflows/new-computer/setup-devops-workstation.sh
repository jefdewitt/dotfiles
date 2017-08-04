#!/usr/bin/env bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_directory="$DEV_PROJECTS_ROOT"
scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"
workflows_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/workflows"

# make our projects directory if it doesn't exist
mkdir -p "$projects_directory"

"$workflows_directory"/new-computer/setup-churchill-basics.sh

declare -a apps=(
    "sdkman"
    "docker"
    "slack"
)

for app in "${apps[@]}"
do
    echo "Installing: $app"
    sh "$scripts_directory"/apps/"$app"/install.sh || {
        echo "Failed to install: $app"
    }
done