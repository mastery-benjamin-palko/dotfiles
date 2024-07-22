#!/bin/bash

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs
nix-channel --update

nix-shell '<home-manager>' -A install
home-manager switch

