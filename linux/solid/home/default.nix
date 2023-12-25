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

   # Enable GTK
   gtk.enable = true;

   # Keyboard Layout
   home.keyboard = {
    layout = "us";
    variant = "intl";
    #variant = "altgr-intl";
    options = ["compose:ralt"];
   };

   # C cedilla
   home.file.".Xcompose".text = ''
include "%L"
#  Overridig C with acute:
<Multi_key> <dead_acute> <C>            : "Ç" Ccedilla  # LATIN CAPITAL LETTER C WITH CEDILLA
<Multi_key> <dead_acute> <c>            : "ç" ccedilla  # LATIN SMALL LETTER C WITH CEDILLA
   '';
   #home.sessionVariables = {
       #GTK_IM_MODULE = "cedilla";
       #QT_IM_MODULE = "cedilla";
   #};

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


