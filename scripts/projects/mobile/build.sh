#!/bin/bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

mobile_dir="$DEV_PROJECTS_ROOT/mobile"

cd "$mobile_dir"
{
  grunt release
} || {  # a cheap try-catch, attempt a npm install automatically then re-attempt grunt
  echo "Forcing npm install to resolve common 'grunt not found'"
  npm install
  grunt release
}
