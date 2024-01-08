{ config, pkgs, ...}:
{
   programs.neovim.enable = true;
   programs.neovim.defaultEditor= true;
   programs.neovim.viAlias = true;
   programs.neovim.vimAlias = true;
   programs.neovim.vimdiffAlias = true;
   programs.neovim.withNodeJs = true;
   programs.neovim.withPython3 = true;
   programs.neovim.withRuby = true;
}
