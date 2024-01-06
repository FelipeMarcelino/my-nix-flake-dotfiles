{ config, pkgs, ...}:
{
   imports = [
	./xdg.nix
	./ripgrep.nix
	./fzf.nix
	./mpv.nix
   ];

   home.file."${config.xdg.configHome}/cheat/conf.yml".source = ./cheat.yaml;
}
