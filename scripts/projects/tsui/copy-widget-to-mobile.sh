#!/bin/sh 

echo "Copying to mobile"


${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_root="$DEV_PROJECTS_ROOT"
widget_name=$1
tsui_widgets="$projects_root/tsui/widgets"
tsui_dist_dir="$tsui_widgets/releases"
mobile_dist_dir="$projects_root/mobile/dist/resources/shared/extlibs/tsui"

tsui_widget_dist="$tsui_dist_dir/$widget_name/"
mobile_widget_dist="$mobile_dist_dir/widgets/$widget_name/"

echo "copying $widget_name to $mobile_widget_dist"
cp -Rf "$tsui_widget_dist" "$mobile_widget_dist"