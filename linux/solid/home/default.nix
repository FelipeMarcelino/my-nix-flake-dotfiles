{ config, pkgs,...}:

{
   xsession.enable = true;

   imports = [
	./i3/default.nix
	./rofi/default.nix
	./xrandr/default.nix
	./dunst/default.nix
	./xdg/default.nix
	./polybar/default.nix
	./mopidy/default.nix
	./password/default.nix
	./spotifyd/default.nix
   ];
   
   home.packages = with pkgs; [
	hwinfo
	p7zip
	pavucontrol
	ranger
	discord
	tdesktop
	ffmpegthumbnailer	
	gparted
	youtube-dl
	python3
	python311Packages.fontforge
	networkmanager_dmenu
	dmenu
	lm_sensors
	alsa-utils
	libmpdclient
   ];

   programs.htop = {
	enable = true;
	package = pkgs.htop-vim;
   };

   # Enable GTK
   gtk.enable = true;

   # Keyboard Layout
   home.keyboard = {
    layout = "us";
    variant = "intl";
    model = "hhk";
    };

   # C cedilla
   home.file.".XCompose".text = ''
include "%L"
<dead_acute> <C>            : "Ç" Ccedilla  # LATIN CAPITAL LETTER C WITH CEDILLA
<dead_acute> <c>            : "ç" ccedilla  # LATIN SMALL LETTER C WITH CEDILLA
'';


   # Fonts
   fonts.fontconfig.enable = true;

   # MPD + Mpris
   services.mpd.enable = true;
   services.mpdris2.enable = true;

   # Misc
   programs.feh.enable = true;
   services.blueman-applet.enable = true;
   services.flameshot.enable = true;

   # Git
   programs.git.userEmail = "felipe.marcelino1991@gmail.com";
   programs.git.userName = "Felipe Marcelino";

   # Pulseaudio
   services.pasystray.enable = true;

   # Clipmenu
   services.clipmenu.enable = true;
   services.clipmenu.launcher = "rofi";

   home.sessionVariables = {
	FORGIT_COPY_CMD="xclip -selection clipboard";
	TERMINAL="wezterm -e --always-new-process";
   };
   
}


