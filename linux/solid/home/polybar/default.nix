{ config, pkgs, ...}:
{

   services.playerctld.enable = true;

   home.packages = with pkgs; [
   	zscroll
	playerctl
   ];
    
   services.polybar ={
	enable = true;
	package = pkgs.polybarFull;
	script = ''
		#!/user/bin/env bash
		# Add this script to your wm startup file.

		DIR="$XDG_POLYBAR"/cuts

		# Terminate already running bar instances
		killall -q -I -r -s SIGKILL polybar

		# Wait until the processes have been shut down
		while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
		# Launch the bar
		polybar -q right -c "$DIR"/config.ini &
		polybar -q left -c "$DIR"/config.ini &
	'';
   };
}
