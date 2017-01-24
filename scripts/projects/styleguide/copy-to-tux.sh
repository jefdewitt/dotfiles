#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

styleguide_dir=$DEV_PROJECTS_ROOT/styleguide/
tux_dir=$DEV_PROJECTS_ROOT/tsui/

cp -Rf $styleguide_dir $tux_dir/styleguide/

if cd $tux_dir/styleguide;
then
    rm -rf .git
    rm -rf .gitignore
fi