{ config, pkgs, ...}:
{
   programs.yt-dlp = {
	enable = true;
	settings = {
	  #extract.base-directory = ''builtins.getEnv("XDG_YT_DLP")'';
	};
   };
}
