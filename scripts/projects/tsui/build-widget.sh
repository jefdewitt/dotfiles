#!/bin/sh

# Builds your widget in TSUI

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects_root="$DEV_PROJECTS_ROOT"
widget_name=$1
tsui_widgets="$projects_root/tsui/widgets"
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