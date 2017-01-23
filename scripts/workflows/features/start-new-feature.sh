#/bin/bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

feature_name=$1
parameter=$2

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

  cd $repo

  if [ `git branch --list $feature_name ` ]
  then
      echo "Feature branch already exists"
      if [ "$parameter" = "--force" ]
      then
        echo "Force deleting feature branch"
        git branch -D $feature_name
        git push personal --delete $feature_name
      fi
  fi

  echo "Getting latest for $repo/master"
  git checkout master
  git pull origin master

  echo "Pushing $repo/master latest to personal fork"
  git push -f personal master

  if [ -n "$feature_name" ]; then
    echo "Creating $repo/$feature_name branch"
    git checkout -b $feature_name
    echo "Pushing $repo/$feature_name branch to personal fork"
    git push -u personal $feature_name
  fi
done
