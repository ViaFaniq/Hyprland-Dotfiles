#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SOURCE="$SCRIPT_DIR/.config"

if [[ ! -f /etc/arch-release ]]; then
    echo "This script is intended for Arch Linux." >&2
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
    echo "Run this script as your regular user; it will use sudo for pacman." >&2
    exit 1
fi

if [[ ! -d "$CONFIG_SOURCE" ]]; then
    echo "Configuration directory not found: $CONFIG_SOURCE" >&2
    exit 1
fi

if command -v paru >/dev/null 2>&1; then
    AUR_HELPER=paru
elif command -v yay >/dev/null 2>&1; then
    AUR_HELPER=yay
else
    echo "Install paru or yay first; wlogout and several configured apps/themes are in the AUR." >&2
    exit 1
fi

PACMAN_PACKAGES=(
    hyprland waybar wofi kitty dolphin firefox
    hyprpaper hyprlock hypridle polkit-kde-agent
    xdg-desktop-portal xdg-desktop-portal-hyprland
    swayosd cliphist grim slurp wl-clipboard
    dunst brightnessctl playerctl pavucontrol
    pipewire pipewire-pulse wireplumber networkmanager
    fish qt6ct kvantum nwg-look xsettingsd
    papirus-icon-theme ttf-jetbrains-mono-nerd gtk3 gtk4
)

AUR_PACKAGES=(
    wlogout visual-studio-code-bin equibop-bin catppuccin-gtk-theme-mocha
)

echo "=== Installing packages from Arch repositories ==="
sudo pacman -Syu --needed "${PACMAN_PACKAGES[@]}"

echo "=== Installing packages from the AUR with $AUR_HELPER ==="
"$AUR_HELPER" -S --needed "${AUR_PACKAGES[@]}"

echo "=== Copying configurations to ~/.config ==="
mkdir -p "$HOME/.config"
cp -a "$CONFIG_SOURCE/." "$HOME/.config/"

echo "=== Installation complete ==="
echo "Restart your Hyprland session to apply the configuration."