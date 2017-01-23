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
whitelabel_dir="$projects_root/whiteLabel"

echo "building whitelabel - classic"
cd "$whitelabel_dir/Classic"
time make install

echo "building whiteLabel - shared"
cd "$whitelabel_dir/shared"
time make install