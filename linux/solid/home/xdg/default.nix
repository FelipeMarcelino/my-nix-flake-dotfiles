{ config, pkgs, ...}:
{
   xdg.mimeApps.enable = true;
   xdg.mime.enable = true;
   xdg.userDirs = {
   	extraConfig = {
	   XDG_DEV_DIR = "${config.home.homeDirectory}/Development";
	   XDG_DOTFILES = "${config.home.homeDirectory}/Development/nix-dotfiles";
	   XDG_POLYBAR = "${config.home.homeDirectory}/Development/nix-dotfiles/linux/solid/home/polybar";
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
