{ config, pkgs, ...}:
{
   imports = [
	./xdg.nix
	./ripgrep.nix
	./fzf.nix
   ];

   home.file."${config.xdg.configHome}/cheat/cheat.yaml".source = ./cheat.yaml;
}
