#!/bin/bash
# author: pepe vila
# date: 2015/11/18

set -e

# Clone, compile and install v8 (takes a whiiile)
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
echo export PATH=`pwd`/depot_tools:'$PATH' >> ~/.bashrc
export PATH=`pwd`/depot_tools:"$PATH"
export GYP_DEFINES="v8_use_external_startup_data=0"
fetch v8
cd v8 && make x64.release gdbjit=on console=readline
sudo ln -s ~/v8/out/x64.release/d8 /usr/bin

# Installs Node Version Manager and set node stable as default
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install stable
nvm alias default stable
