if status is-interactive
    # Wyłączenie domyślnego powitania powłoki
    set -g fish_greeting ""

    # Przydatne aliasy
    alias ls='ls --color=auto'
    alias la='ls -A --color=auto'
    alias ll='ls -alF --color=auto'
    alias grep='grep --color=auto'
    alias c='clear'
    alias q='exit'
    alias reload='source ~/.config/fish/config.fish'

    # Kolorystyka powłoki Catppuccin Mocha
    set -g fish_color_normal cdd6f4
    set -g fish_color_command 89b4fa
    set -g fish_color_param f2cdcd
    set -g fish_color_keyword f38ba8
    set -g fish_color_quote a6e3a1
    set -g fish_color_redirection f5e0dc
    set -g fish_color_end fab387
    set -g fish_color_comment 7f849c
    set -g fish_color_error f38ba8
    set -g fish_color_gray 6c7086
    set -g fish_color_selection --background=313244
    set -g fish_color_search_match --background=313244
    set -g fish_color_operator f5e0dc
    set -g fish_color_escape f2cdcd
    set -g fish_color_autosuggestion 6c7086
end