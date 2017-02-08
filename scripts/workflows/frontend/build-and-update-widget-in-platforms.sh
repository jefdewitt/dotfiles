#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts_directory="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"

widget_name=$1

# build widget in tsui
$scripts_directory/tsui/build-widget.sh $widget_name

# replace in mobile 
$scripts_directory/tsui/copy-widget-to-mobile.sh $widget_name

# replace in tux 
$scripts_directory/tsui/copy-widget-to-tux.sh $widget_name

# replace in desktop 
$scripts_directory/tsui/copy-widget-to-desktop.sh $widget_name
