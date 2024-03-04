#!/bin/bash

# files
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tool-versions ~/.tool-versions

# directories
if test -d ~/.config/nvim/; then
  ls -s ~/dotfiles/nvim/ ~/.config/nvim/
fi
if test -d ~/.config/k9s; then
  ls -s ~/dotfiles/k9s/ ~/.config/k9s/
fi

