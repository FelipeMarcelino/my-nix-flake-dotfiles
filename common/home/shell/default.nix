{ config, pkgs, ...}:

{
    imports = [
	./startship.nix
	./terminal.nix
	./zsh.nix
    ];


}

