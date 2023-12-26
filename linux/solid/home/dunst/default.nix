{ config, pkgs, ...}:
{
   services.dunst = {
       enable = true;
       settings = {
	   global = {
	       monitor = 1;
	       follow = "none";
	       dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p dunst:";
	   };

	   experimental = {
	       per_monitor_dpi = true;
	   };

	   urgency_low.timeout = 5;
           urgency_normal.timeout = 10;
      	   urgency_critical.timeout = 15;

	};
   };
}
