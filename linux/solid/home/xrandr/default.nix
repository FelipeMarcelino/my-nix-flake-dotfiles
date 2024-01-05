{ config, pkgs, ...}:
{
   home.packages = with pkgs; [
	arandr
   ];

   # Autorandr
   programs.autorandr.enable = true;
   services.autorandr.enable = true;
   programs.autorandr.hooks.postswitch = {
	polybar="systemctl --user restart polybar.service";
   };

}
