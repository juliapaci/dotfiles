#!/bin/zsh
unsetopt PROMPT_SP

# Default programs:
export EDITOR="nvim"
export TERMINAL="foot"
export TERMINAL_PROG=$TERMINAL
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export MOZ_USE_XINPUT2=1
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME="gtk2"

[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc ] && shortcuts >/dev/null 2>&1 &

# Start graphical server on user's current tty if not already running.
# [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
# [ "$(tty)" = "/dev/tty1" ] && ! pidof -s river >/dev/null 2>&1 && exec river
