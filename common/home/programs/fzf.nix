{ config, pkgs, ...}:
{
   home.packages = with pkgs; [
   	(import ./rfv.nix { inherit config pkgs; })
   ];
	
   programs.fzf = {
	enable = true;
   };
}
