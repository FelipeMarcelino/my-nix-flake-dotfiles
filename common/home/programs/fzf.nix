{ config, pkgs, ...}:
{
   home.packages = with pkgs; [
   	(import ./rfv.nix { inherit config pkgs; })
   	(import ./fdf.nix { inherit config pkgs; })
   ];
	
   programs.fzf = {
	enable = true;
	defaultCommand = ''
	   fd --glob "*" --type d  | fzf --prompt  '>Directories> ' \
             --header 'CTRL-D: Directories / CTRL-F: Files' \
             --bind 'ctrl-d:change-prompt(Directories> )+reload(fd --glob "*" --type d)' \
             --bind 'ctrl-f:change-prompt(Files> )+reload(fd --glob "*" --type f)' \
	'';
   };

   


}
