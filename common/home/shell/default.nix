{ config, pkgs, ...}:

{
    imports = [
	./startship.nix
	./terminal.nix
	./zsh.nix
	./bat.nix
	./eza.nix
	./delta.nix
    ];

    home.packages = with pkgs; [
	coreutils-full
    ];


}

