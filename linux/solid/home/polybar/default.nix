{ config, pkgs, ...}:
{
   services.polybar ={
	enable = true;
	package = pkgs.polybarFull;
	script = "polybar top &";
	config = {  
		"bar/top" = {    monitor = "\${env:MONITOR:DP-0}";    width = "100%";    height = "3%";    radius = 0; modules-left = "i3"; modules-center = "date"; scroll-up = "#i3.prev"; scroll-down="#i3.next"; font-0 = "FiraCode Nerd Font:size=10;1"; };  
		"module/date" = {    type = "internal/date";    internal = 5;    date = "%d-%m-%y";    time = "%H:%M";    label = "%time%  %date%";  };
		"module/i3" = { type = "internal/i3"; pin-workspaces=true; show-urgent=true; strip-wsnumbers=true; index-sort=true; enable-scroll=true; wrapping-scroll=true; 
				reverse-scroll=true; fuzzy-match=true; ws-icon-1="1;"; ws-icon-2="2;"; ws-icon-3="3;"; ws-icon-4="4;";ws-icon-5="5;"; ws-icon-6="6:";
				ws-icon-7="7;"; ws-icon-8="8;"; ws-icon-9="9;"; ws-icon-0="10;"; format = "<label-state> <label-mode>"; label-mode = "%mode%"; 
				label-mode-padding = 2; label-separator = "|";};
	};
   };
}
