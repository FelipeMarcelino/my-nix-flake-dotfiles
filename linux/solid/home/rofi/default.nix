{ lib, stdenv, fetchFromGitHub, config, pkgs, ...}:

let 
   rofi-themes = (import ./rofi-themes {inherit lib stdenv fetchFromGitHub;});
in
{
    programs.rofi = {
	enable = true;
	terminal = "wezterm";
	theme = "./rofi/files/launchers/type-1/style-6.rasi";
    };

    # for rofi-emoji
    home.packages = [ 
    	pkgs.xdotool 
	rofi-themes

    ];
}
