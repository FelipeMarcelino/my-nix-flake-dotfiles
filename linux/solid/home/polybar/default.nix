{ config, pkgs, ...}:

let 
   bars = buitins.readFile ./cuts/bars.ini;
   colors = buitins.readFile ./cuts/colors.ini;
   cutConfig = buitins.readFile ./cuts/config.ini;
   modules = buitins.readFile ./cuts/modules.ini;
   user_modules = buitins.readFile ./cuts/user_modules.ini;
in
{

   services.playerctld.enable = true;

   home.packages = with pkgs; [
   	zscroll
	playerctl
   ];
    
   services.polybar ={
	enable = true;
	package = pkgs.polybarFull;
	config = cutConfig;
	extraConfig = bars + colors + modules + user_modules;
	script = ''
		# Add this script to your wm startup file.

		DIR=/home/felipemarcelino/Development/nix-dotfiles/linux/solid/home/polybar/cuts

		# Terminate already running bar instances
		killall -q -I -r -s SIGKILL polybar

		# Wait until the processes have been shut down
		# while ${pkgs.toybox}/bin/pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

		# Launch the bar
		polybar -q right -c "$DIR/config.ini" &
		polybar -q left -c "$DIR/config.ini" &
	'';
   };
}
