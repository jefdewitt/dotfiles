#!/bin/bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

tsui_dir="$DEV_PROJECTS_ROOT/tsui"

#clear out the widget/releses folder in tsui so we can easily see what specific widgets we are working on
echo "cleaning the tsui releases folder..."
rm -Rf "$tsui_dir/widgets/releases/"

echo "building /tsui"
cd "$tsui_dir"
{
  grunt
} || {
  npm install && grunt
}

echo "building /tsui/app"
cd "$tsui_dir/app"
{
  grunt
} || {
  npm install && grunt
}

echo "building /tsui/core"
cd "$tsui_dir/core"
{
  grunt
} || {
  npm install && grunt
}

echo "building /tsui/widgets"
cd "$tsui_dir/widgets"
{
  grunt
} || {
  npm install && grunt
}
