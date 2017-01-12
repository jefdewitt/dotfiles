#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

project_dir=$DEV_PROJECTS_ROOT/dotfiles

cd "$project_dir"

# echo "fetching recent files included"
# cp -f $HOME/.zshrc $project_dir/.zshrc

git add -A
git commit -m "Updated dotfiles."
git push origin master
