{config, pkgs, ...}:

(pkgs.writeShellApplication {
	name = "rfv";
	runtimeInputs = [ pkgs.bc ];
	text = builtins.readFile ./rfv.sh;
})
