#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

tux_dir="$DEV_PROJECTS_ROOT/tux"
tsui_dir="$DEV_PROJECTS_ROOT/tsui/"

cp -Rf $tsui_dir $tux_dir/tsui/

if cd $tux_dir/tsui;
then
    rm -rf .git
    rm -rf .gitignore
fi