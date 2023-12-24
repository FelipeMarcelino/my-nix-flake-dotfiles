{ config, pkgs, ...}:

{
    imports = [
	./startship.nix
	./terminal.nix
	./zsh.nix
    ];

    home.packages = with pkgs; [
	coreutils-full
    ];


}

