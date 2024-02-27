#!/bin/bash

echo "Installing apt packages..."
_installPackagesApt "${packagesApt[@]}";

echo "Installing snap packages..."
_installPackagesSnap "${packagesSnap[@]}";

echo "Installing brew packages..."
_installPackagesBrew "${packagesBrew[@]}";

