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

nix-shell -p git --command "git clone ${dotfiles} ~/dotfiles"
cd ~/dotfiles || (echo "Failed to clone dotfiles" && exit)

# config symlinks
source .install/symlink.sh

# home-manager installation
source .install/install-home-manager.sh

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
