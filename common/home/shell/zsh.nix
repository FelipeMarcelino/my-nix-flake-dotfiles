{ config, pkgs, ...}:
{
   programs.zsh.enable = true;
   programs.zsh.enableCompletion = true;
   programs.fzf.enableZshIntegration = true;
   programs.nix-index.enableZshIntegration = true;
   programs.skim.enableZshIntegration = true;
   programs.zoxide.enableZshIntegration = true;
   programs.starship.enableZshIntegration = true;
   programs.direnv.enableZshIntegration = true;
   programs.zsh.enableAutosuggestions = true;
   programs.zsh.enableVteIntegration = true;
   programs.zsh.historySubstringSearch.enable = true;
   programs.zsh.oh-my-zsh.enable = true;
   programs.zsh.syntaxHighlighting.enable = true;
   programs.zsh.zsh-abbr.enable = true;
   programs.dircolors.enableZshIntegration = true;
   programs.zsh.defaultKeymap = "viins";
   programs.zsh.dirHashes = {
	docs = "$HOME/Documents";
	vids = "$HOME/Videos";
	dl = "$HOME/Downloads";
	pics = "$HOME/Pictures";
	dev = "$HOME/Development";
	mus = "$HOME/Music";
	dot = "$HOME/Development/nix-dotfiles";
   };
   programs.zsh.history.extended = true;
   programs.zsh.historySubstringSearch.searchDownKey = [ ];
   programs.zsh.historySubstringSearch.searchUpKey = [ ];
   programs.zsh.oh-my-zsh.plugins = [ "sudo" "vi-mode" "scala" "sbt" "ripgrep" 
	"python" "colored-man-pages" "cp" "aliases" "alias-finder" "common-aliases" "fasd" "git" ];

   programs.zsh.plugins = 
   [  
	{name = "forgit";    src = pkgs.fetchFromGitHub {      owner = "wfxr";      repo = "forgit";      rev = "23.09.0";      sha256 = "WvJxjEzF3vi+YPVSH3QdDyp3oxNypMoB71TAJ7D8hOQ=";    }; file = "forgit.plugin.zsh"; } 
   ];
   programs.zsh.initExtra = ''
bindkey '^ ' autosuggest-accept
zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default
   '';

  programs.zsh.loginExtra = ''

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
  '';
  programs.zsh.shellAliases = {
   run = "nix run .#activate";
   cat = "bat --paging=never";
   du = "dust";
   df = "duf";
  };
  programs.zsh.localVariables = {
    KEYTIMEOUT = 15;	
  };

}
