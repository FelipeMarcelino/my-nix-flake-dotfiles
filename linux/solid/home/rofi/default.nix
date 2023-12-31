{config, pkgs, ...}:
{

    programs.rofi = {
	enable = true;
	terminal = "wezterm";
	package = (pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; });
	theme = ./onedark.rasi;
	
    };

    home.packages = [ 
    	pkgs.xdotool 
    ];

}
