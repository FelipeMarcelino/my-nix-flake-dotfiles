{ config, pkgs, ...}:
let 
   augmentedOpen = (import ./augmented-open.nix {inherit config pkgs;})
in
{
   xdg.mimeApps.enable = true;
   xdg.userDirs = {
   	extraConfig = {
	   XDG_DEV_DIR = "${config.home.homeDirectory}/Development";
	};
   };

   xdg.desktopEntries = 
   {
	augmentedOpen
   };
}
