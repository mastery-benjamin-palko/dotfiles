#!/bin/bash

sudo apt-get install sassc

if [ ! -d ~/dotfiles/.temp/WhiteSur-icon-theme ]; then
  gh repo clone vinceliuice/WhiteSur-icon-theme ~/dotfiles/.temp/WhiteSur-icon-theme
fi

~/dotfiles/.temp/WhiteSur-icon-theme/install.sh

if [ ! -d ~/dotfiles/.temp/WhiteSur-gtk-theme ]; then
  gh repo clone vinceliuice/WhiteSur-gtk-theme ~/dotfiles/.temp/WhiteSur-gtk-theme
fi

~/dotfiles/.temp/WhiteSur-gtk-theme/install.sh --darker

