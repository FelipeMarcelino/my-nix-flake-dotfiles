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
   };

}
