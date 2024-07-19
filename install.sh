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

# config symlinks
source .install/symlink.sh

# nix setup
echo "Installing Nix"
source .install/install-nix.sh

# kubernetes
source .install/azure-setup.sh

# set up mastery repos
source .install/setup-development.sh

# zsh
source .install/zsh-setup.sh

# asdf tools
asdf plugin add nodejs
asdf plugin add bun
asdf plugin add yarn
asdf plugin add python
asdf plugin add golang
asdf install

