{config, pkgs, ...}:

(pkgs.writeShellApplication {
	name = "rfv";
	text = builtins.readFile ./rfv.sh;
})
