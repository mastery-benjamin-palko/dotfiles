#!/bin/bash

dotfiles=https://github.com/mastery-benjamin-palko/dotfiles.git

echo -e "${GREEN}"
cat <<"EOF"
    | |     | |  / _(_) |          
  __| | ___ | |_| |_ _| | ___  ___ 
 / _` |/ _ \| __|  _| | |/ _ \/ __|
| (_| | (_) | |_| | | | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/
                                   
EOF
echo -e "${NONE}"

# nix setup
echo "Installing Nix"
sh <(curl -L https://nixos.org/nix/install) --no-daemon
source "$HOME"/.bashrc || (echo "Failed to source .bashrc" && exit)

# clone dotfiles
if [ -d ~/dotfiles ]; then
	echo "Deleting existing dotfiles"
	rm -rf ~/dotfiles
fi

nix-shell -p git --command "git clone -b nix ${dotfiles} ~/dotfiles"
cd ~/dotfiles || (echo "Failed to clone dotfiles" && exit)

# home-manager installation
source .install/install-home-manager.sh

# docker
source .install/install-docker.sh

# kubernetes
source .install/azure-setup.sh

# set up mastery repos
source .install/setup-development.sh

