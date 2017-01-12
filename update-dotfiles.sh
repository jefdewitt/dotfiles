#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

project_dir=$DEV_PROJECTS_ROOT/dotfiles

cd $project_dir

chmod -R +x scripts/

git add -A
git commit -m "Updated dotfiles."
git push origin master
