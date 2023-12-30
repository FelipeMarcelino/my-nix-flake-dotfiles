{ lib, stdenv, fetchFromGitHub, config, pkgs, ...}:

{

    imports = [
	./rofi-themes/flake.nix
    ];
    programs.rofi = {
	enable = true;
	terminal = "wezterm";
    };

    # for rofi-emoji
    home.packages = [ 
    	pkgs.xdotool 
    ];
}
