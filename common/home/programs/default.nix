{ config, pkgs, ...}:
{
   imports = [
	./xdg.nix
	./ripgrep.nix
	./fzf.nix
   ];
}
