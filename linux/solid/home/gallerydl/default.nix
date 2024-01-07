{ config, pkgs, ...}:
{
   programs.gallery-dl = {
	enable = true;
	settings = {
	  extract.base-directory = "${builtins.getEnv(\"XDGGALLERY_DL\"}";
	};
   };
}
