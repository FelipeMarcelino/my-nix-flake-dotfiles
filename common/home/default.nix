{ config, pkgs, ...}:

{

   imports = [
	./shell/default.nix
	./development/default.nix
   ];

   home.packages = with pkgs; [
	firefox
	zoom-us
	fasd
	spotify
	unrar
   ];

   programs.nix-index.enable = true;
   programs.git.enable = true;
   programs.skim.enable = true;
   programs.fzf.enable = true;
   programs.ripgrep.enable = true;
   programs.zathura.enable = true;

   services.gpg-agent = {
	enable = true;
	enableZshIntegration = true;
	enableSshSupport = true;
   };

    programs.direnv = {
	enable = true;
	nix-direnv.enable = true;
	enableZshIntegration = true;
    };

    fonts.fontconfig.enable = true;
}


