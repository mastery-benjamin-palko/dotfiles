#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew --version

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/benjaminpalko/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source ~/.bashrc
brew --version

