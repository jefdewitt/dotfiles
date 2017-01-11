#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

project_dir=$DEV_PROJECTS_ROOT/dotfiles
install_dir=$HOME

echo "installing dotfiles"
cp $project_dir/.zshrc $install_dir/.zshrc

echo "completed"

zsh
