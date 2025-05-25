#!/bin/bash

# Step 2: Install required packages
install_packages() {
    echo "Installing required packages..."

    # Install official packages from the Arch repos
    sudo pacman -S --noconfirm \
        firefox \
        qbittorrent \
        vlc \
        mpv \
        neofetch \
        nodejs \
        npm \

    # Install AUR packages using yay
    yay -S --noconfirm \
        google-chrome \
        pnpm \
    	spotify
}

# Main script execution
install_packages
echo "Installation complete!"
