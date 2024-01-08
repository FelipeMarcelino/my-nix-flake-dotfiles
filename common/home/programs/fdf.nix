{config, pkgs, ...}:

(pkgs.writeShellApplication {
	name = "fdf";
	text = builtins.readFile ./fdf.sh;
})
