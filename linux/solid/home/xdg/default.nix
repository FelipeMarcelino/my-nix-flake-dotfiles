{ config, pkgs, ...}:
{
   xdg.mimeApps.enable = true;
   xdg.mime.enable = true;
   xdg.userDirs = {
   	extraConfig = {
	   XDG_DEV_DIR = "${config.home.homeDirectory}/Development";
	   XDG_DOTFILES = "${config.home.homeDirectory}/Development/nix-dotfiles";
	   XDG_POLYBAR = "${config.home.homeDirectory}/Development/nix-dotfiles/linux/solid/home/polybar";
	   XDG_GALLERY_DL  = "${config.home.homeDirectory}/Data/gallery-dl";
	   XDG_YT_DLP = "${config.home.homeDirectory}/Data/yt-dlp";
	   XDG_INSTALOADER = "${config.home.homeDirectory}/Data/instaloader";
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
