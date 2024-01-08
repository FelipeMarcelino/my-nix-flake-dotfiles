{ config, pkgs, ...}:
{
   programs.git = {
   	enable = true;
	extraConfig = {
	   user = {
		user = "felipe.marcelino1991@gmail.com";
		signingkey = "9AA9415FA1237FD0";
	   };
	   push = {
	   	autoSetupRemote = true;
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
	   delta = {
	   	navigate = true;
		light = false;
		side-by-side = true;
		line-numbers = true;
		hyperlinks = true;
		hyperlinks-file-link-format = "file-line://{path}:{line}";
		true-color = "always";
	   };
	   merge = {
	   	conflictstyle = "diff3";
	   };
	   diff = {
	   	colorMoved = "default";
	   };
	   
	};

	delta = { 
	   enable = true;
	};
   };
}
