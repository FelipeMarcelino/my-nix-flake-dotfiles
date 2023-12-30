{ config, pkgs, ...}:

{
    programs.rofi = {
	enable = true;
	terminal = "wezterm";
	theme = "./rofi/files/launchers/type-1/style-6.rasi";
    };

    # for rofi-emoji
    home.packages = [ 
    	pkgs.xdotool 
	(import ./rofi-themes.nix)
    ];
}
