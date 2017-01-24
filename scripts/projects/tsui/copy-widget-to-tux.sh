#!/bin/sh 

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

widget_name=$1
tsui_directory=$DEV_PROJECTS_ROOT/tsui/
tux_directory=$DEV_PROJECTS_ROOT/tux/

cp -Rf $tsui_dir $tux_dir/tsui/

if cd $tux_dir/styleguide;
then
    rm -rf .git
    rm -rf .gitignore
fi

