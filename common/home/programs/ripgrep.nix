{ config, pkgs, lib,  ...}:
{
   programs.ripgrep = {
   	enable = true;
	arguments = [
	   #"--max-columns-preview"
	   #"--max-columns=150"
	   #"--hidden"
	   #"--max-depth=10"
	   #"--glob=!.git/*"
	   #"--no-binary"
	   #"--only-matching"
	   #"--context=2"
	   #"--smart-case"
	   #"--colors=line:none"
	   #"--colors=line:style:bold"
	];
	   
   };
}
