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

   # Misc
   programs.feh.enable = true;
   programs.blueman-applet.enable = true;
   services.flameshot.enable = true;


   # Git
   programs.git.userEmail = "felipe.marcelino1991@gmail.com";
   programs.git.userName = "Felipe Marcelino";

   # Pulseaudio
   services.pasystray.enable = true;
   
}


