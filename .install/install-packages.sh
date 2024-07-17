#!/bin/bash

echo "Installing apt packages..."
_installPackagesApt "${packagesApt[@]}";

echo "Installing flatpak packages..."
_installPackagesFlatpak "${packagesFlatpak[@]}";

