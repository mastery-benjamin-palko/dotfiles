#!/bin/bash

# Set shell to zsh
chsh -s $(which zsh)

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

source ~/.zshrc

