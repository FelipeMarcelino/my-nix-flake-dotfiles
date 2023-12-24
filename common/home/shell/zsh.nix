{ config, pkgs, ...}:
{
   programs.zsh.enable = true;
   programs.zsh.enableCompletion = true;
   programs.fzf.enableZshIntegration = true;
   programs.nix-index.enableZshIntegration = true;
   programs.skim.enableZshIntegration = true;
   programs.wezterm.enableZshIntegration = true;
   programs.zoxide.enableZshIntegration = true;
   programs.starship.enableZshIntegration = true;
   programs.direnv.enableZshIntegration = true;
   programs.zsh.enableAutosuggestions = true;
   programs.zsh.enableVteIntegration = true;
   programs.zsh.historySubstringSearch.enable = true;
   programs.zsh.oh-my-zsh.enable = true;
   programs.zsh.syntaxHighlighting.enable = true;
   programs.zsh.zsh-abbr.enable = true;
   programs.hstr.enable = true;
   programs.hstr.enableZshIntegration = true;
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
   programs.zsh.oh-my-zsh.plugins = [ "sudo" "git" "vi-mode" "scala" "sbt" "ripgrep" 
	"python" "colored-man-pages" "cp" "aliases" "alias-finder" "common-aliases" ];

   programs.zsh.initExtra = ''
bindkey '^ ' autosuggest-accept
   '';

  programs.zsh.loginExtra = ''
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
  '';
  programs.zsh.shellAliases = {
   run = "nix run .#activate";
  };
}
