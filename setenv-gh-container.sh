#!/bin/bash

cp -v device-templates/community_devices.yml .

cp -rv device-templates/apt-config/* pre-overlay/

#set -e

sources_dir="/buildd/sources"

## Update apt
apt-get update

## Install prereqs
apt-get install vim git mkbootimg file -y

## Install berb-mkbootmg-mgr
branch="testing"
url="https://raw.githubusercontent.com/berbascum/berb-android-mkbootimg-mgr/refs/heads/${branch}"
bin_script="berb-mkbootimg-mgr.sh"
cfg_script="mkbootimg-config-vayu.sh"
## Download binary to bin system path
wget ${url}/${bin_script} -O /usr/bin/${bin_script%.sh} || error "Download ${bin_script} failed!"
chmod +x /usr/bin/${bin_script%.sh}

## Download berb-mkboot-mgr vayu conf to current dir
wget ${url}/${cfg_script} || error "Download ${cfg_script} failed!"
