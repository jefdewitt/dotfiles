#!/usr/bin/env bash

# HOW TO USE: https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/new-computer/ReadMe.md

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"

declare -a apps=(
    "homebrew"
    "flowdock"
    "joinme"
    "google-chrome"
    "mozilla-firefox"
)

for app in "${apps[@]}"
do
    echo "Installing: $app"
    sh "$scripts_directory"/apps/"$app"/install.sh || {
        echo "Failed to install: $app"
    }
done
