{ config, pkgs, ...}:
let 
dotPath = builtins.getEnv("XDG_DOTFILES");
in 
{
   programs.mpv = {
	enable = true;
	bindings = builtins.readFile "${dotPath}/common/home/programs/input_mpv.conf";
	package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }) 
	{ 
	youtubeSupport = true; 
	scripts = with pkgs.mpvScripts; [mpris seekTo cutter autoload autocrop thumbfast quality-menu mpv-playlistmanager blacklistExtensions ];
	};
   };
}
