#!/bin/sh

project_dir=$HOME/proj/dotfiles

cd "$project_dir"

echo "fetching recent files included"
cp -f $HOME/.zshrc $project_dir/.zshrc

git add .
git commit -m "Updated dotfiles."
git push origin master
