#!/bin/bash

echo "Installing apt packages..."
_installPackagesApt "${packagesApt[@]}";

echo "Installing flatpak packages..."
_installPackagesFlatpak "${packagesFlatpak[@]}";

echo "Installing brew packages..."
_installPackagesBrew "${packagesBrew[@]}";

