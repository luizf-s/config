function addtopath {
    case ":$PATH:" in
        *"$1"*)                ;; # already in PATH
             *) PATH="$1":$PATH;; # add it to PATH
    esac
}


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    addtopath $HOME/bin
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    addtopath $HOME/.local/bin
fi
. "$HOME/.cargo/env"

EDITOR=vim
VISUAL=vim

set -o vi

# addtopath <++>

alias battery="upower -i $(upower -e | grep BAT) | grep --color=never -E 'state|to\ full|to\ empty|percentage'"
alias son="xrandr --output HDMI-1 --right-of eDP-1 --auto"
alias soff="xrandr --output HDMI-1 --off"

alias ls="ls        --color --group-directories-first"
alias ll="ls -lh -X --color --group-directories-first"
alias la="ls -a     --color --group-directories-first"
