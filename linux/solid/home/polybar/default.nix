{lib,  config, pkgs, ...}:
{

   services.playerctld.enable = true;

   services.polybar ={
	enable = true;
	package = pkgs.polybarFull;
	script = ''
		# Add this script to your wm startup file.
		export PATH="$PATH:${lib.makeBinPath [pkgs.zscroll pkgs.playerctl pkgs.toybox pkgs.coreutils-full pkgs.bash 
						      pkgs.wezterm pkgs.ranger pkgs.rxvt-unicode pkgs.firefox pkgs.chromium pkgs.tor-browser
						      pkgs.discord pkgs.telegram-desktop pkgs.nnn pkgs.rofi pkgs.networkmanager_dmenu]}"	    

		DIR=/home/felipemarcelino/Development/nix-dotfiles/linux/solid/home/polybar/cuts

		# Terminate already running bar instances
		killall -q -I -r -s SIGKILL polybar

		# Wait until the processes have been shut down
		# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

		sleep 1

		# Launch the bar
		polybar -q right -c "$DIR/config.ini" &
		polybar -q left -c "$DIR/config.ini" &
	'';
   };
}
