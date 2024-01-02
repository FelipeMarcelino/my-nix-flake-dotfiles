{ config, pkgs, ...}:
{
   services.mopidy = {
   	enable = true;
	extensionPackages = with pkgs; [ mopidy-spotify mopidy-mpd mopidy-mpris mopidy-youtube mopidy-notify mopidy-local];
	settings = {
	   m3u = {
	   };
	};
   };
}
