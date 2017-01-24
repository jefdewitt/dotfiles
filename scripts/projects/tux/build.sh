#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

tux_dir="$DEV_PROJECTS_ROOT/tux"

cd $tux_dir
{
  grunt
}
{
  npm install
  grunt
}
