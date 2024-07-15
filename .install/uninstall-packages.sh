#!/bin/bash

source ./includes/library.sh

source ./packages/general.sh

echo "Installing apt packages..."
_uninstallPackagesApt "${packagesApt[@]}";

echo "Installing flatpak packages..."
_uninstallPackagesFlatpak "${packagesFlatpak[@]}";

echo "Installing brew packages..."
_uninstallPackagesBrew "${packagesBrew[@]}";
