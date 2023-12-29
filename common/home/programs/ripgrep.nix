{ config, pkgs}:
{
   programs.ripgrep = {
   	enable = true;
	arguments = [
	   "--max-columns-preview"
	   "max-columns=150"
	   "hidden"
	   "--glob"
	   "!.git/*"
	   "--smart-case"
	   "--colors=line:none"
	   "--colors=line:style:bold"
	];
	   
   };
}
