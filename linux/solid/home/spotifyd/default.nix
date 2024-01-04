{ config, pkgs, ...}:
{


   services.spotifyd.enable = true;
   services.spotifyd.package = (
   	pkgs.spotifyd.override {
		withPulseAudio = true;
		withPortAudio = true;
		withMpris = true;
		withKeyring = true;
	}
   );
   services.spotifyd.settings = {
   	global = {
	   username = "felipe.marcelino1991";
	   password_cmd = "secret-tool lookup service spotify username spotify_password";
	   use_mpris = true;
	   dbus_type = "session";
	   backend = "pulseaudio";
	   bitrate = 320;
	   autoplay =true;
	   device_name = "solid";
	   initial_volume = "100";
	   device_type = "computer";
	   audio-format = "F32";
	};
   };

}
