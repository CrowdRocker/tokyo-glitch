#!/bin/bash
set -e

### Tokyo Glitch Rice Installer 🧬⚡

echo -e "\n🌆 Tokyo Glitch Environment Booting...\n"
sleep 1
echo "→ Mounting cyberpunk modules..."
sleep 1
echo "→ Streaming glitch overlays..."
sleep 1
echo "→ Injecting ambient audio particles..."
sleep 1
echo -e "\n✅ Boot sequence complete.\n"

# 🔊 Play ambient loop (optional)
if command -v ffplay >/dev/null; then
  ffplay -nodisp -loop 0 assets/audio/tokyo-glitch-loop.mp3 &
else
  echo "⚠️ FFmpeg not found, skipping ambient audio..."
fi

echo "📦 Installing required packages..."
sudo pacman -S --needed \
  hyprland swayfx waybar sddm \
  nwg-dock nwg-drawer yad wl-clipboard ffmpeg firefox

echo "🗂️ Creating config directories..."
mkdir -p ~/.config/{hypr,swayfx,waybar,nwg-dock,nwg-drawer}
mkdir -p ~/.local/share/icons
sudo mkdir -p /usr/share/sddm/themes

echo "📁 Copying rice configurations..."
cp -r configs/hypr/* ~/.config/hypr/
cp -r configs/swayfx/* ~/.config/swayfx/
cp -r configs/waybar/* ~/.config/waybar/
cp -r configs/nwg-dock/* ~/.config/nwg-dock/
cp -r configs/nwg-drawer/* ~/.config/nwg-drawer/
cp -r assets/icons/* ~/.local/share/icons/
sudo cp -r assets/sddm-theme /usr/share/sddm/themes/tokyo-glitch

echo "🎨 Applying SDDM theme..."
echo -e "[Theme]\nCurrent=tokyo-glitch" | sudo tee /etc/sddm.conf > /dev/null

# 🧬 Post-install dialog with preview/reload options
yad --title="Tokyo Glitch Activated" \
  --width=500 --height=350 \
  --text="<span font='10'><b>Installation complete!</b></span>\n\nChoose your next move:" \
  --button="👀 Preview Splash:0" --button="🔁 Reload Compositor:1" --button="🚪 Exit:2"

case $? in
  0)
    echo "🎆 Launching splash..."
    firefox ./splash/index.html & ;;
  1)
    echo "🔁 Reloading compositor..."
    hyprctl reload || swaymsg reload ;;
  *)
    echo "🚪 Exiting installer..." ;;
esac

echo -e "\n🧠 All systems operational. Welcome to Tokyo Glitch.\n"

