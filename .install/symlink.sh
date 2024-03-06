#!/bin/bash

# dot files
files=(
  ".zshrc"
  ".bashrc"
  ".tool-versions"
  ".gitconfig"
)

_symlinkFiles() {
  for file; do
    if [ -h ~/${file} ]; then
      continue
    fi
    if [ -f ~/${file} ]; then
      rm ~/${file}
    fi
    ln -s ~/dotfiles/${file} ~/${file}
  done;
}

# dot config
configs=(
  "k9s"
  "neofetch"
  "nvim"
)

_symlinkDirs() {
  for config; do
    if [ -h ~/.config/${config} ]; then
      continue
    fi
    if [ -d ~/.config/${config}/ ]; then
      echo "Deleting existing directory ${config}"
      rm -rf ~/.config/${config}/
    fi
    ln -s ~/dotfiles/${config}/ ~/.config/
  done;
}

# gnome-looks
gnome=(
  ".themes"
  ".icons"
)

_symlinkGnome() {
  for config; do
    if [ -h ~/${config} ]; then
      continue
    fi
    if [ -d ~/${config}/ ]; then
      echo "Deleting existing directory ${config}"
      rm -rf ~/${config}/
    fi
    ln -s ~/dotfiles/${config}/ ~/
  done;
}

_symlinkFiles "${files[@]}"
_symlinkDirs "${configs[@]}"
_symlinkGnome "${gnome[@]}"

