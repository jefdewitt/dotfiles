#!/bin/sh

################################
# "Desktop Dev - VM Build and Replace Widgets"
#
# "What does this do?"
# 1. Builds phpWebServices
#
################################

# intentionally vm path
projects_root=/mnt/code
project_dir="$projects_root/phpWebServices"

echo "building phpWebServices"
cd "$project_dir"
time make install
