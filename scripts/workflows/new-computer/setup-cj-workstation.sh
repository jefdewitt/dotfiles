#!/usr/bin/env bash

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts"
workflows_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/workflows"

"$workflows_directory"/new-computer/setup-frontend-workstation.sh
"$workflows_directory"/new-computer/setup-devops-workstation.sh

declare -a apps=(
    "iterm2"
    "oh-my-zsh"
    "vscode"
    "python"
    "pip"
    "thefuck"
    "virtualenv"
)

for app in "${apps[@]}"
do
    echo "Installing: $app"
    sh "$scripts_directory"/apps/"$app"/install.sh || {
        echo "Failed to install: $app"
    }
done