#!/bin/bash

if ! az account list-locations; then
  az login --use-device-code
fi

source ~/dotfiles/.install/kubernetes/clusters.sh

