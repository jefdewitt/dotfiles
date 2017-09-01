#!/usr/bin/env bash 

mkdir -p $DEV_PROJECTS_ROOT/$USER/devops

# get prepare_iso script 
cd $DEV_PROJECTS_ROOT/$USER/devops
git clone https://github.com/timsutton/osx-vm-templates.git

cd osx-vm-templates

sudo prepare_iso/prepare_iso.sh -u vagrant -p vagrant "/Applications/Install macOS Sierra.app" out

# -- MD5: 982ac3a7abddac8da37c2ad71f4e138b
# -- Done. Built image is located at out/OSX_InstallESD_10.12.6_16G29.dmg. Add this iso and its checksum to your template.
cd packer

packer build \
  -var iso_checksum=982ac3a7abddac8da37c2ad71f4e138b \
  -var iso_url=../out/OSX_InstallESD_10.12.6_16G29.dmg \
  -var username=vagrant \
  -var password=vagrant \
  -var install_vagrant_keys=false \
  -only virtualbox-iso \
  template.json