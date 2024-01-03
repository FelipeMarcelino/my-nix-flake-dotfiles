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
	username = "$SPOTIFY_USERNAME";
	password = "$SPOTIFY_PASSWORTD";
	use_mpris = true;
   };

}
