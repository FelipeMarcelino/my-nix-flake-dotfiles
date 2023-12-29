{ config, pkgs, ...}:
{
   imports = [
	./xdg.nix
	./ripgrep.nix
	./fzf.nix
   ];

   xdg.file."${config.xdg.configHome}/cheat/cheat.yaml".source = ../../cheat.yaml
}
