#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

tux_dir="$DEV_PROJECTS_ROOT/tux"
tsui_dir="$DEV_PROJECTS_ROOT/tsui/"
styleguide_dir="$DEV_PROJECTS_ROOT/styleguide/"

#Copy your tsui project to the tsui/ folder in the tux project
# and then remove the .git/ and .gitignore, so you don't get
# submodule notices when trying to commit tux.
echo "copying $tsui_dir to tux ..."
cp -Rf $tsui_dir $tux_dir/tsui/

if cd $tux_dir/tsui;
then
    echo "removing git repo files from tux/tsui folder"
    rm -rf .git
    rm -rf .gitignore
fi

#Copy your styleguide project to the styleguide/ folder in the tux project
# and then remove the .git/ and .gitignore, so you don't get
# submodule notices when trying to commit tux.
echo "copying $styleguide_dir to tux ..."
cp -Rf $styleguide_dir $tux_dir/styleguide/

if cd $tux_dir/styleguide;
then
    echo "removing git repo files from tux/styleguide folder"
    rm -rf .git
    rm -rf .gitignore
    npm install 
fi

#Finaly, build tux
echo "Building tux ..."
cd $tux_dir
{
  grunt
}
{
  npm install
  grunt
}
