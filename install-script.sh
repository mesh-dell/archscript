#!/bin/bash

# Step 1: Install necessary dependencies (git, base-devel) and AUR helper
install_dependencies() {
    echo "Installing base-devel, git, and yay (AUR helper)..."
    
    # Install base-devel and git if not already installed
    sudo pacman -S --noconfirm base-devel git yay
}

# Step 2: Install required packages
install_packages() {
    echo "Installing required packages..."

    # Install official packages from the Arch repos
    sudo pacman -S --noconfirm \
        firefox \
        qbittorrent \
        vlc \
        mpv \
        gparted \
        postgresql \
        neofetch \
        nodejs \
        golang \
        npm \
        snapd \
        spotify \
        yay \
        git

    # Install AUR packages using yay
    yay -S --noconfirm \
        google-chrome \
        vscode \
        xdm \
        ventoy \
        bun \
        pnpm
}

# Step 3: Enable and start services (for snapd and postgresql)
enable_services() {
    echo "Enabling and starting services..."

    # Enable snapd
    sudo systemctl enable --now snapd.socket

    # Enable and start postgresql
    sudo systemctl enable --now postgresql
}

# Step 4: Clean up
cleanup() {
    echo "Cleaning up..."
    sudo pacman -Rns $(pacman -Qdtq) --noconfirm
    sudo pacman -Scc --noconfirm
}

# Main script execution
install_dependencies
install_packages
enable_services
cleanup

echo "Installation complete!"
