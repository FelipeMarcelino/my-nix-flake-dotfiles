{ config, pkgs, ...}:

{
    imports = [
	./startship.nix
	./terminal.nix
	./zsh.nix
	./bat.nix
    ];

    home.packages = with pkgs; [
	coreutils-full
    ];


}

