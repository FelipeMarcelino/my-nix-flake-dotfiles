{ config, pkgs, ...}:

{
   xsession.enable = true;

   imports = [
	./i3/default.nix
	./rofi/default.nix
	./xrandr/default.nix
	./dunst/default.nix
	./xdg/default.nix
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

   # Misc
   programs.feh.enable = true;
   services.blueman-applet.enable = true;
   services.flameshot.enable = true;

   # Git
   programs.git.userEmail = "felipe.marcelino1991@gmail.com";
   programs.git.userName = "Felipe Marcelino";

   # Pulseaudio
   services.pasystray.enable = true;
   
}


