{ config, pkgs, ... }:
{
   programs.eza = {
   	enable = true;
	enableAliases = true;
	git = true;
	icons = true;
	extraOptions = [
	"--group-directories-first"
	"--smart-group"
	"--header"
	"--total-size"
	"--git"
	"--header"
	"--hyperlink"];
   };
}
