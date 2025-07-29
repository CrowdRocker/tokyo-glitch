#!/bin/bash
echo "💠 Setting up Tokyo Cyberpunk Arch Rice..."

# Install packages
sudo pacman -Syu sway swayfx waybar kitty nwg-drawer wofi starship swww fastfetch rofi thunar

# Fonts and icons
mkdir -p ~/.local/share/fonts
cp assets/icons/*.svg ~/.local/share/icons/
fc-cache -fv

# Copy dotfiles
cp -r dotfiles/* ~/.config/

# Wallpaper
swww init
swww img assets/wallpapers/tokyo-neon.png

echo "✅ Setup complete. Reboot into your neon dojo."
