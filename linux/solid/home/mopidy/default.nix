{ config, pkgs, ...}:
{
   services.mopidy = {
   	enable = true;
	extensionPackages = with pkgs; [ mopidy-spotify mopidy-mpd mopidy-mpris mopidy-youtube mopidy-notify mopidy-local mopidy-iris];
	settings = {
	   spotify = {
	   	enabled = true;
		client_id = "6603cc0f-9582-4480-9b1a-17e2ec102318";
		client_secret = "CkFb_nvQPWWHsdv-hE9QrdtGuP2RhEUp1JPdk3PUrgE=";
		username = "$SPOTIFY_USERNAME";
		password = "$SPOTIFY_PASSWORD";
		bitrate = 320;
	   };
	};
   };

   systemd.user.services."def-spotify-username-password" = {
	Unit = {
	   After = [ "network.target" "sound.target" ];
	   Before = [ "mopidy.service" ];
	   Description = "Get username and password from Gnome Keyring";
	};

	Service = {
	   ExecStart = "/home/felipemarcelino/Development/nix-dotfiles/linux/solid/home/mopidy/mopidy.sh";
	};

   };
}
