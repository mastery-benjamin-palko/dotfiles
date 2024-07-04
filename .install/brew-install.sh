#!/bin/bash

# dependencies
sudo apt-get install git curl build-essential -y

# install
if [[ $(command -v brew) == "" ]]; then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  (
    echo
    echo "eval \"$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\""
  ) >>"$HOME"/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  source "$HOME"/.bashrc
else
  echo "Updating brew..."
  brew update
fi
brew --version
