#!/bin/bash
set -e

### Tokyo Glitch Installer ✨🧬

# Dependencies
echo "📦 Installing core packages..."
sudo pacman -S --needed \
  hyprland swayfx waybar sddm \
  nwg-dock nwg-drawer wl-clipboard yad

# Directory setup
echo "🗂️ Setting up config directories..."
mkdir -p ~/.config/{hypr,swayfx,waybar,nwg-dock,nwg-drawer}
mkdir -p ~/.local/share/icons
mkdir -p /usr/share/sddm/themes

# Deploy configs
echo "📁 Copying rice configs..."
cp -r configs/hypr/* ~/.config/hypr/
cp -r configs/swayfx/* ~/.config/swayfx/
cp -r configs/waybar/* ~/.config/waybar/
cp -r configs/nwg-dock/* ~/.config/nwg-dock/
cp -r configs/nwg-drawer/* ~/.config/nwg-drawer/
cp -r assets/icons/* ~/.local/share/icons/
sudo cp -r assets/sddm-theme /usr/share/sddm/themes/tokyo-glitch

# Set SDDM Theme
echo "🎨 Applying SDDM theme..."
echo -e "[Theme]\nCurrent=tokyo-glitch" | sudo tee /etc/sddm.conf > /dev/null

# Optional: Splash Preview Toggle
yad --title="Tokyo Glitch Post-Install" \
  --width=500 --height=350 \
  --text="Installation complete!\n\nWould you like to preview the splash screen or reload your compositor?" \
  --button="Show Splash:0" --button="Reload & Exit:1" --button="Skip:2"

choice=$?
if [ "$choice" == "0" ]; then
  echo "🎆 Launching splash..."
  firefox ./splash/index.html &
elif [ "$choice" == "1" ]; then
  echo "🔁 Reloading compositor..."
  hyprctl reload || swaymsg reload
fi

echo "✅ Tokyo Glitch installation complete!"

