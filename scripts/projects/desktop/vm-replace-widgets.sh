#!/bin/sh

################################
# "Desktop Dev - VM Build and Replace Widgets"
#
# Note: Used by the "Desktop-dev-build-and-replace-widgets.sh" (Expected to be run on vm with 'sudo -i')
# can be run in the vm manually too.
#
# "What does this do?"
# 1. Builds WhiteLabel Classic
# 2. Builds WhiteLabel Shared
# 3. Builds and deploys TSUI widgets
#
################################

# intentionally vm path
projects_root=/mnt/code

tsui_dir="$projects_root/tsui"
tsui_widgets_dir="$tsui_dir/widgets"
whitelabel_dir="$projects_root/whiteLabel"

echo "building whitelabel - classic"
cd "$whitelabel_dir/Classic"
make install

echo "building whiteLabel - shared"
cd "$whitelabel_dir/shared"
make install

echo "building tsui widgets"
cd "$tsui_widgets_dir"
grunt deploy
