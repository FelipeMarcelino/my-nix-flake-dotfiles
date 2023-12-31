{config, pkgs, ...}:
{

    programs.rofi = {
	enable = true;
	terminal = "wezterm";
	package = (pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; });
	theme = ./onedark.rasi;
	extraConfig = (builtins.readFile ./config.rasi);
	
    };

    home.packages = [ 
    	pkgs.xdotool 
    ];

}
