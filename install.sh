#!/bin/bash

source .install/includes/library.sh
clear

echo -e "${GREEN}"
cat <<"EOF"
    | |     | |  / _(_) |          
  __| | ___ | |_| |_ _| | ___  ___ 
 / _` |/ _ \| __|  _| | |/ _ \/ __|
| (_| | (_) | |_| | | | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/
                                   
EOF
echo -e "${NONE}"

sudo apt-get install curl git build-essentials

# package managers
source .install/brew-install.sh

# package installation
source .install/packages/general.sh
source .install/install-repositories.sh
source .install/install-packages.sh

# config symlinks
source .install/symlink.sh

# zsh
source .install/zsh-setup.sh

# kubernetes
source .install/kubernetes/clusters.sh

