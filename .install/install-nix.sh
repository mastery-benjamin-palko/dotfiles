#!/bin/bash

sh <(curl -L https://nixos.org/nix/install) --no-daemon

source ~/.bashrc

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

home-manager switch

