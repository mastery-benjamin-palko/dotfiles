#!/bin/bash

nix run home-manager/master -- switch --flake "$HOME"/dotfiles

