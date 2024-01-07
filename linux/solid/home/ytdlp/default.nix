{ config, pkgs, ...}:
{
   programs.gallery-dl = {
	enable = true;
	settings = {
	  extract.base-directory = ''builtins.getEnv("XDG_YT_DLP")'';
	};
   };
}
