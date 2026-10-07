# Hyprland Dotfiles

Minimalist, "angular" (kanciasty) Hyprland desktop environment configuration tailored with a **Catppuccin Mocha Mauve** aesthetic.

## Stack & Technologies

* **Window Manager:** [Hyprland](https://hyprland.org/) (Lua configuration)
* **Status Bar:** [Waybar](https://github.com/Alexays/Waybar) (styled with custom CSS)
* **OSD & Hardware:** `swayosd` (Volume, microphone gain via `Super`, and lock state indicators)
* **Color Palette:** Catppuccin Mocha (`#cba6f7` Mauve accent, 0px border-radius)
* **OS:** Arch Linux

## Repository Structure

```tree
.
├── .config/
│   ├── Kvantum/
│   ├── gtk-3.0/
│   ├── gtk-4.0/
│   ├── hypr/
│   │   └── hyprland.lua
│   ├── waybar/
│   │   ├── config.jsonc
│   │   └── style.css
│   └── wofi/
│       └── style.css
└── README.md