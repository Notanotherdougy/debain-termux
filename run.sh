#!/bin/bash

# Ensure necessary directories are created
mkdir -p $HOME/debian

# Setup script for installing Debian
setup_debian() {
    echo "[+] Setting up Debian..."

    # Install necessary packages
    pkg install proot wget -y

    # Download and extract Debian filesystem
    wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Debian/debian.sh -O $HOME/debian/debian.sh
    bash $HOME/debian/debian.sh

    # Auto-start Debian on Termux launch
    echo "proot-distro login -p Debian" > $PREFIX/bin/debian
    chmod +x $PREFIX/bin/debian

    echo "[+] Debian setup complete."
}

# Function to auto-start Debian on Termux launch
setup_auto_start() {
    echo "[+] Setting up auto-start for Debian..."

    # Add command to .bashrc for auto-starting Debian
    echo "debian" >> $HOME/.bashrc

    echo "[+] Auto-start setup complete."
}

# Main script execution
setup_debian
setup_auto_start
