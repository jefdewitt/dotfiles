#!/bin/sh 

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

mobile_dist_dir="$DEV_PROJECTS_ROOT/mobile/dist/resources/shared/extlibs/tsui/widgets/"
tsui_dist_dir="$DEV_PROJECTS_ROOT/tsui/widgets/releases/"

cp -Rf "$tsui_dist_dir" "$mobile_dist_dir"
