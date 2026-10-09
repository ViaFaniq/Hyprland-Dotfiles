------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@74.97",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"
local browser     = "firefox"
local powerMenu   = "wlogout"
local codeEditor  = "code"
local Communicator = "org.equicord.equibop"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    --hl.exec_cmd("hyprpaper")
    hl.exec_cmd("awww")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1 &")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("GDK_BACKEND", "wayland,x11,*")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in     = 8,
        gaps_out    = 16,
        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(cba6f7ee)", "rgba(f5c2e7ee)"}, angle = 45 },
            inactive_border = "rgba(1e1e2eee)",
        },

        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 0,
        active_opacity   = 0.90,
        inactive_opacity = 0.75,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled           = true,
            size              = 6,
            passes            = 3,
            ignore_opacity    = true,
            new_optimizations = true,
            vibrancy          = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },

    input = {
        kb_layout    = "pl",
        follow_mouse = 1,
        sensitivity  = -0.9,

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Animations Curvse
hl.curve("snappy", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("smooth", { type = "bezier", points = { {0.25, 1},   {0.5, 1}    } })

-- Animations
hl.animation({ leaf = "windows",     enabled = true, speed = 3, bezier = "snappy", style = "popin 80%" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3, bezier = "snappy", style = "popin 80%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 2, bezier = "smooth", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "snappy", style = "slide" })
hl.animation({ leaf = "fade",        enabled = true, speed = 3, bezier = "smooth" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 3, bezier = "snappy", style = "slide" })
hl.animation({ leaf = "border",      enabled = true, speed = 4, bezier = "smooth" })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- App --
hl.bind(mainMod .. " + Return",       hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",            hl.dsp.window.close())
-- hl.bind(mainMod .. " + SHIFT + Q",    hl.dsp.exit())
hl.bind(mainMod .. " + E",            hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W",            hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D",            hl.dsp.exec_cmd("pkill wofi || " .. menu))


-- Window --
hl.bind(mainMod .. " + SHIFT + V",    hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",            hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + P",            hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))

-- VIM (HJKL) --
hl.bind(mainMod .. " + H",            hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L",            hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",            hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",            hl.dsp.focus({ direction = "down" }))

-- Nav Arrows --
hl.bind(mainMod .. " + left",         hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",        hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",           hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",         hl.dsp.focus({ direction = "down" }))

-- Move Windows --
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "down" }))

-- Desktop (1-10) --
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- ScreenSchoot --
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
hl.bind("PRINT",                       hl.dsp.exec_cmd('grim ~/Pictures/Screenshot_$(date +%Y%m%d_%H%M%S).png'))

-- Mouse
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })

-- Multimedia keyboard
--hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })
--hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),      { locked = true, repeating = true })
--hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume +1"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume -1"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl set 5%+"),                         { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl set 5%-"),                         { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --input-volume +5"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --input-volume -5"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay",      hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause",     hl.dsp.exec_cmd("playerctl pause"),      { locked = true })
hl.bind("XF86AudioNext",      hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",      hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- More window / workspace controls --
hl.bind(mainMod .. " + Tab",          hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }))
hl.bind(mainMod .. " + B",           hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M",           hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + M",   hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + bracketright",hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + bracketleft",  hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Misc
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + V",      hl.dsp.exec_cmd("pkill wofi || cliphist list | " .. menu .. " --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + X",      hl.dsp.exec_cmd("pkill " .. powerMenu .." || " .. powerMenu))
hl.bind(mainMod .. " + C",      hl.dsp.exec_cmd(codeEditor))
hl.bind(mainMod .. " + Z",      hl.dsp.exec_cmd(Communicator))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "float-utility-windows",
    match = { class = "(pavucontrol|org.kde.polkit-kde-authentication-agent-1)" },
    float = true,
})
