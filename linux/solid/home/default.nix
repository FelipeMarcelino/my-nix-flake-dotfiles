{ config, pkgs, ...}:

{
   xsession.enable = true;

   imports = [
	./i3/default.nix
	./rofi/default.nix
	./xrandr/default.nix
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

   # C cedilla
   home.file.".Xcompose".text = ''
include "%L"
#  Overriding C with acute:
<dead_acute> <C>            : "Ç" Ccedilla  # LATIN CAPITAL LETTER C WITH CEDILLA
<dead_acute> <c>            : "ç" ccedilla  # LATIN SMALL LETTER C WITH CEDILLA
   '';
   home.sessionVariables = {
       GTK_IM_MODULE = "xim";
       QT_IM_MODULE = "xim";
   };



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


