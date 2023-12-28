{ config, pkgs, ...}:
{
   xdg.mimeApps.enable = true;
   xdg.userDirs = {
   	extraConfig = {
	   XDG_DEV_DIR = "${config.home.homeDirectory}/Development";
	};
   };

   # Entries
   imports = [
	./augmented-open.nix
   ];
}
