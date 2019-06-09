# This file is read each time a login shell is started.

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

export PATH="/var/lib/snapd/snap/bin/:$HOME/bin/:$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH"

export WINDOWMANAGER="i3"

export TERMINAL="kitty"

export EDITOR="vim"

export QT_QPA_PLATFORMTHEME="gtk2"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	echo "Enter '1' for lightdm, '2' for startx, 'q' for nothing, or anything else for sway"
	read selection && case $selection in
		1)
			sudo systemctl start lightdm
			;;
		2)
			startx
			;;
		q)
			;;
		*)
			export QT_QPA_PLATFORM=wayland-egl
			export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
			#export SDL_VIDEODRIVER=wayland # causes issues with lots of games
			export CLUTTER_BACKEND=wayland
			export BEMENU_BACKEND=wayland
			#export MOZ_ENABLE_WAYLAND=1 # only enable if you hate your life
			export KITTY_ENABLE_WAYLAND=1
			sway
			;;
	esac
fi
