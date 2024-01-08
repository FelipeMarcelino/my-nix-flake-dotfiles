{ config, pkgs, ...}:
{
   programs.gallery-dl = {
	enable = true;
	settings = {
	  extract.base-directory = "${config.home.homeDirectory}/Data/gallery-dl";
	};
   };
}
