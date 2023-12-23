{ config, pkgs, ...}:

{

   imports = [
	./shell/default.nix
   ];

   home.packages = with pkgs; [
	firefox
   ];

   programs.nix-index.enable = true;
   programs.git.enable = true;
   programs.zsh.enable = true;
   programs.skim.enable = true;
   programs.fzf.enable = true;
   programs.ripgrep.enable = true;

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


