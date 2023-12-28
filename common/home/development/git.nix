{ config, pkgs, ...}:
{
   programs.git = {
   	delta.enable = true
   	enable = true;
	options = {
	   core = {
		pager = "delta";
	   };
	   user = {
		user = "felipe.marcelino1991@gmail.com";
		signingkey = "9AA9415FA1237FD0";
	   };
	   init = {
	   	defaultBranch = "main";
	   };
	   commit = {
	   	gpgsign = true;
	   };
	   tag = {
	   	gpgsign = true;
	   };
	   interactive = {
	   	diffFilter = "delta --color-only";
	   };
	   delta = {
	   	navigate = true;
		light = false;
	   };
	   merge = {
	   	conflictstyle = "diff3";
	   };
	   diff = {
	   	colorMoved = "default";
	   }
	   
	};
   };
}
