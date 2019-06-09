# ~/.bashrc

# If not running interactively, do not do anything
[[ $- != *i* ]] && return

if [[ -f ~/.aliases ]]; then
	. ~/.aliases
fi

export EDITOR=vim

GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
RESET="\[$(tput sgr0)\]"

# Cute PS1 for su
if [[ $UID -eq 0 ]]; then
	PS1="[${RED}\w${RESET}] ${RED}#${RESET} "
else
	PS1="[${GREEN}\w${RESET}] ${GREEN}\$${RESET} "
fi

# Loads wal theme for a beautiful terminal
# wal --theme base16-brushtrees -b "#253238"
wal -R > /dev/null