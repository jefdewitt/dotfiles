#!/bin/sh

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

cd $DEV_PROJECTS_ROOT/styleguide
{
    grunt
} 
{
    npm install 
    grunt
}