#!/bin/bash

# Set shell to zsh
chsh -s chsh -s $(which zsh)

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/benjaminpalko/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source ~/.bashrc
brew --version

