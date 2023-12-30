{ config, pkgs, ...}:
{
   home.packages = with pkgs; [
   	(import ./rfv.nix { inherit config pkgs; })
   	#(import ./fdf.nix { inherit config pkgs; })
   ];
	
   programs.fzf = {
	enable = true;
	defaultCommand ="fd";
	defaultOptions =["--border" "--height 60%" "--layout=reverse" "--info=inline" "--margin 1"  "--padding 1"];
	fileWidgetOptions = [  "--preview 'bat -n --color=always {}'"];
   };


   


}
