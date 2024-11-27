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

EDITOR=vim
VISUAL=vim

set -o vi

# addtopath <++>

alias son="xrandr --output HDMI-1 --right-of eDP-1 --auto"
alias soff="xrandr --output HDMI-1 --off"

alias ls="ls        --color --group-directories-first"
alias ll="ls -lh -X --color --group-directories-first"
alias la="ls -a     --color --group-directories-first"

common() {
  is_compton_running=$(pidof compton)

  if [[ -z $is_compton_running  ]]; then
    echo "starting compton"
    compton &
    disown %compton
  fi

  echo "setting bg"
  feh --bg-fill ~/Pictures/bg.jpg
}

second_monitor() {
  target=$(xrandr | grep -E '^HDMI.* connected' | sed -E 's/\s.*//g')
  if [ "$1" = "on" ]; then
    xrandr --output $target --auto --right-of eDP-1
  fi

  if [ "$1" = "off" ]; then
    xrandr --output $target --off
  fi

  common
}

