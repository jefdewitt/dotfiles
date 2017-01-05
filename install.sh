#!/bin/sh

project_dir=$HOME/proj/dotfiles

install_dir=$HOME

echo "installing dotfiles"
cp $project_dir/.zshrc $install_dir/.zshrc

echo "completed"
