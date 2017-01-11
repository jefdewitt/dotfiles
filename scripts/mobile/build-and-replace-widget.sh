#!/bin/sh

# Builds your widget in TSUI and updates it in your Mobile project for local development.
#
# If your git repos are checked out to a folder structure like the
# example below, then all you should need to do is set the
# value of $projects_root to point to the folder that contains
# your projects. If your structure doesn't look like the example,
# then you'll need to set the $tsui_dir and $mobile_dir
# variables as well.
#
# Example folder structure
#
# - /path/to/my/projects/
#    - tsui/
#    - mobile/

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_root="$DEV_PROJECTS_ROOT"
widget_name=$1
tsui_widgets="$projects_root/tsui/widgets"
mobile_dist_dir="$projects_root/mobile/dist/resources/shared/extlibs/tsui"
tsui_dist_dir="$tsui_widgets/releases"
tsui_widget_source="$tsui_widgets/$widget_name"

msg_err_build_and_copy_manually="Caveat - This widget is not handled like most. Build and copy it manually into place for now until this can be scripted."

# blacklisted for handling automatically until more is learned about specifics.
# pencil in over time if necessary/valuable
  if [[ $widget_name = "common" ]]; then
    echo $msg_err_build_and_copy_manually
    exit 1
  fi
  if [[ $widget_name = "ecommerce" ]]; then
    echo $msg_err_build_and_copy_manually
    exit 1
  fi
  if [[ $widget_name = "quickdeposit" ]]; then
    echo $msg_err_build_and_copy_manually
    exit 1

  fi
  if [[ $widget_name = "registration" ]]; then
    echo $msg_err_build_and_copy_manually
    exit 1
  fi
  if [[ $widget_name = "rtb" ]]; then
    echo $msg_err_build_and_copy_manually
    exit 1
  fi
  if [[ $widget_name = "ssnCollection" ]]; then
    echo $msg_err_build_and_copy_manually
    exit 1
  fi


echo "building $widget_name source"
cd "$tsui_widget_source"
grunt

# known name changing between src to dist
  if [[ $widget_name = "list-Filters" ]]; then
    widget_name="listFilters"
  fi
  if [[ $widget_name = "my-account" ]]; then
    widget_name="myAccount"
  fi
  if [[ $widget_name = "my-bets" ]]; then
    widget_name="myBets"
  fi

tsui_widget_dist="$tsui_dist_dir/$widget_name/"
mobile_widget_dist="$mobile_dist_dir/widgets/$widget_name/"

echo "$widget_name dist now in $tsui_widget_dist"

echo "copying $widget_name release to $mobile_widget_dist"
cp -Rf "$tsui_widget_dist" "$mobile_widget_dist"
