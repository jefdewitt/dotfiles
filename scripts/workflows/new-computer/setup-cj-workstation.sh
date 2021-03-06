#!/usr/bin/env bash

dotfiles_directory="$DEV_PROJECTS_ROOT/dotfiles"
scripts_directory="$dotfiles_directory/scripts"
workflows_directory="$scripts_directory/workflows"

"$workflows_directory"/new-computer/setup-frontend-workstation.sh
"$workflows_directory"/new-computer/setup-backend-workstation.sh
"$workflows_directory"/new-computer/setup-devops-workstation.sh

declare -a apps=(
    "iterm2"
    "oh-my-zsh"
    "vscode"
    "python"
    "pip"
    "thefuck"
    "virtualenv"
    "rvm"
    "oh-my-zsh-navigation"
    "oh-my-zsh-syntax-highlighting"
    "shellcheck"
    "slack"
    "shiftit"
    "flux"
    "atom"
    "vagrant-manager"
    "kitematic"
    "caffeine"
    "spotify"
    "datagrip"
    "dotnet-core-cli"
    "dotnet-core-sdk"
)

for app in "${apps[@]}"
do
    echo "Installing: $app"
    sh "$scripts_directory"/apps/"$app"/install.sh || {
        echo "Failed to install: $app"
    }
done

"$dotfiles_directory"/install.sh

zsh