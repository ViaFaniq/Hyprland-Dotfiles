# Hyprland binds

## Mod key

- `SUPER` = Windows key

## General app binds

- `SUPER + Enter` — open terminal (`kitty`)
- `SUPER + E` — open file manager (`dolphin`)
- `SUPER + W` — open browser (`firefox`)
- `SUPER + D` — launch app menu (`wofi --show drun`)
- `SUPER + C` — open VS Code
- `SUPER + Z` — open communicator (`org.equicord.equibop`)
- `SUPER + V` — clipboard history via `wofi` and `cliphist`
- `SUPER + X` — open power menu (`wlogout`)
- `SUPER + Escape` — lock screen (`hyprlock`)

## Window management

- `SUPER + Q` — close active window
- `SUPER + SHIFT + V` — toggle floating window
- `SUPER + F` — toggle fullscreen
- `SUPER + P` — toggle pseudotiling
- `SUPER + J` — toggle split layout

## Focus navigation

- `SUPER + H` / `Left` — focus left
- `SUPER + L` / `Right` — focus right
- `SUPER + K` / `Up` — focus up
- `SUPER + J` / `Down` — focus down

## Move windows

- `SUPER + SHIFT + H` — move window left
- `SUPER + SHIFT + L` — move window right
- `SUPER + SHIFT + K` — move window up
- `SUPER + SHIFT + J` — move window down

## Workspaces

- `SUPER + 1..0` — switch to workspace 1..10
- `SUPER + SHIFT + 1..0` — move active window to workspace 1..10
- `SUPER + [` — focus previous workspace
- `SUPER + ]` — focus next workspace
- `SUPER + SHIFT + [` — move window to previous workspace
- `SUPER + SHIFT + ]` — move window to next workspace

## Extra toggles

- `SUPER + Tab` — cycle next window
- `SUPER + SHIFT + Tab` — cycle previous window
- `SUPER + B` — toggle floating
- `SUPER + M` — toggle fullscreen
- `SUPER + SHIFT + M` — toggle fullscreen (alternate)
- `SUPER + R` — reload Hyprland config

## Screenshots

- `SUPER + SHIFT + S` — area screenshot copied to clipboard
- `Print` — full screenshot saved to `~/Pictures`

## Mouse

- `SUPER + Left mouse drag` — drag window
- `SUPER + Right mouse drag` — resize window
- `SUPER + Whell mouse down` — e-1 workspace
- `SUPER + Whell mouse up` — e+1 workspace

## Media / brightness / volume

- `XF86AudioRaiseVolume` — raise volume
- `XF86AudioLowerVolume` — lower volume
- `XF86AudioMute` — mute toggle
- `XF86MonBrightnessUp` — brightness up
- `XF86MonBrightnessDown` — brightness down
- `SUPER + XF86AudioRaiseVolume` — input volume up
- `SUPER + XF86AudioLowerVolume` — input volume down
- `SUPER + XF86AudioMute` — input mute toggle

## Notes

- These binds are defined in `hyprland.lua`.
