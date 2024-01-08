{ config, pkgs, ...}:
{

   imports = [
	./neovim/default.nix
	./git.nix
   ];
}
