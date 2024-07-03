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

# package managers
source .install/brew-install.sh

# package installation
source .install/install-repositories.sh
source .install/packages/general.sh
source .install/install-packages.sh

# config symlinks
source .install/symlink.sh

# kubernetes
source .install/azure-setup.sh

# set up mastery repos
source .install/setup-development.sh

# zsh
source .install/zsh-setup.sh

# Install tools
asdf install

# Pywal
source .install/install-pywal.sh

