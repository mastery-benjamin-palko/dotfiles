#!/bin/bash

if ! az account list-locations; then
  az login --use-device-code
fi

source ./kubernetes/clusters.sh
