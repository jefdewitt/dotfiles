#!/bin/bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

feature_name=$1

mobile="$DEV_PROJECTS_ROOT/mobile"
tsui="$DEV_PROJECTS_ROOT/tsui"
tux="$DEV_PROJECTS_ROOT/tux"

for repo in $mobile $tsui $tux
do
  echo "##########################"
  echo "# "
  echo "# Switching to $repo"
  echo "# "
  echo "##########################"

  echo "Getting latest from master"
  git checkout master
  git pull origin master

  if [ `git branch --list $feature_name ` ]
  then

    echo "Checking out $feature_name"
    git checkout $feature_name

    git merge master
  fi
done
