{ config, pkgs, ...}:
{
   programs.mpv = {
	enable = true;
	package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }) { youtubeSupport = true;  }
   }
}
