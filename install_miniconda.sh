#!/bin/bash

# Miniconda Installer Script
# This script downloads, installs, and sets up Miniconda on a Linux system.
# It installs the latest 64-bit version and initializes conda in all available shells.

# Set installation directory and download URL
INSTALL_DIR="$HOME/miniconda3"
INSTALLER_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
INSTALLER_PATH="$INSTALL_DIR/miniconda.sh"

# Step 1: Create installation directory
echo "Creating installation directory at $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"

# Step 2: Download the Miniconda installer
echo "Downloading Miniconda installer..."
wget "$INSTALLER_URL" -O "$INSTALLER_PATH"
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to download the Miniconda installer."
    exit 1
fi

# Step 3: Install Miniconda silently
echo "Installing Miniconda to $INSTALL_DIR..."
bash "$INSTALLER_PATH" -b -u -p "$INSTALL_DIR"
if [[ $? -ne 0 ]]; then
    echo "Error: Installation failed."
    exit 1
fi

# Step 4: Clean up the installer file
echo "Cleaning up installer file..."
rm "$INSTALLER_PATH"

# Step 5: Initialize conda for all shells
echo "Initializing conda for all available shells..."
source "$INSTALL_DIR/bin/activate"
conda init --all
if [[ $? -ne 0 ]]; then
    echo "Error: Conda initialization failed."
    exit 1
fi

# Completion message
echo "Miniconda installation is complete."
echo "Please close and reopen your terminal, or run 'source $INSTALL_DIR/bin/activate' to start using conda."

