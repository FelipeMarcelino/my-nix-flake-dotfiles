{ config, pkgs, ...}:
{
   services.polybar ={
	enable = true;
	package = pkgs.polybarFull;
	script = ''
		# Add this script to your wm startup file.
		#!/usr/bin/env bash

		DIR=$XDG_POLYBAR/cuts

		# Terminate already running bar instances
		${pkgs.killall}/bin/killall -q -I -r -s SIGKILL polybar

		# Wait until the processes have been shut down
		while ${pkgs.toybox}/bin/pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
		# Launch the bar
		polybar -q right -c $DIR/config.ini &
		polybar -q left -c $DIR/config.ini &
	'';
   };
}
