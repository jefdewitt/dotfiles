#!/bin/bash

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

scripts="$DEV_PROJECTS_ROOT/dotfiles/scripts/projects"
workflows="$DEV_PROJECTS_ROOT/dotfiles/scripts/workflows"

# tear down existing vm 
    $scripts/dev_vm/tear-down.sh

# get lastest on projects
    projects=( 
        "dev_vm" 
        "tsui" 
        "tux" 
        "drupal_Adw" 
        "styleguide"
        "whiteLabel" 
    )

    for project in "${projects[@]}"
    do
        echo "Updating $project"
        cd $DEV_PROJECTS_ROOT/$project
        git stash
        git fetch origin
        git checkout master
        git pull 
    done

# build up a fresh vm 

    $workflows/new-computer/provision-and-start-vm-for-development.sh

# update dev_vm with recent changes 

    $scripts/whiteLabel/build.sh


# open idea 