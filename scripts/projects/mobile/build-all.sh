#!/bin/bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

tsui_dir="$DEV_PROJECTS_ROOT/tsui"
mobile_dir="$DEV_PROJECTS_ROOT/mobile"

#clear out the widget/releses folder in tsui so we can easily see what specific widgets we are working on
echo "cleaning the tsui releases folder..."
rm -Rf "$tsui_dir/widgets/releases/*"

# build tsui

if [ -n $1 ];
then
  if [ $1 = '-wd' ];
  then
    $DEV_PROJECTS_ROOT/dotfiles/scripts/projects/tsui/build.sh
  fi
fi


#copy the tsui project to the mobile project's tsuilib folder
echo "copying tsui project to mobile's tsuilib folder..."
cp -Rf "$tsui_dir/" "$mobile_dir/app/resources/shared/extlibs/tsuilib/"
if cd "$mobile_dir/app/resources/shared/extlibs/tsuilib/";
then
    echo "removing git files from tsuilib folder to prevent submodule warnings in git"
    rm -rf .git
    rm -rf .gitignore
fi

#build the mobile site
echo "Finally, building mobile..."
cd "$mobile_dir"
{
  grunt release
} || {  # a cheap try-catch, attempt a npm install automatically then re-attempt grunt
  echo "Forcing npm install to resolve common 'grunt not found'"
  npm install
  grunt release
}
