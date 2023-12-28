{ config, pkgs, ...}:
{
   xdg.mimeApps.enable = true;
   xdg.mime.enable = true;
   xdg.userDirs = {
   	extraConfig = {
	   XDG_DEV_DIR = "${config.home.homeDirectory}/Development";
	};
   };

   # Entries
   imports = [
	./augmented-open.nix
   ];

   xdg.mimeApps.defaultApplications = 
   {
	"x-scheme-handler/file-line-column" = [ "AugmentedOpen.desktop" ];
   };

   xdg.mimeApps.associations.added = 
   {
	"x-scheme-handler/file-line-column" = [ "AugmentedOpen.desktop" ];
   };

}
