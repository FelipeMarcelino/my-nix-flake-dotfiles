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
	busybox
	p7zip
	pavucontrol
   ];

   programs.htop = {
	enable = true;
	package = pkgs.htop-vim;
   };

   # Misc
   programs.feh.enable = true;
   services.flameshot.enable = true;

   # Git
   programs.git.userEmail = "felipe.marcelino1991@gmail.com";
   programs.git.userName = "Felipe Marcelino";

   # Pulseaudio
   services.pasystray.enable = true;
   
   # Autorandr
   programs.autorandr.enable = true;
   services.autorandr.enable = true;

}

