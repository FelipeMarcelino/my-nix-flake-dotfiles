{ config, pkgs, ...}:

{

   imports = [
	./shell/default.nix
	./development/default.nix
	./programs/default.nix
   ];

   home.packages = with pkgs; [
	firefox
	zoom-us
	fasd
	spotify
	unrar
	unzip
	celluloid
	xdg-utils
	du-dust
	duf
	fd
	sd
	choose
	cheat
	tldr
	glances
	hyperfine
	procs
	curlie
	tree
	zsh-forgit
   ];

   programs.nix-index.enable = true;
   programs.skim.enable = true;
   programs.zathura.enable = true;
   programs.jq.enable = true;

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

    home.sessionVariables = {
    	MANPAGER="sh -c 'col -bx | bat -l man -p'";
    };

}


