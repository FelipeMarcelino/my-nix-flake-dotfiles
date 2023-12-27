{config, pkgs, ...}:

(pkgs.writeShellApplication {
	name = "NotifyVol";
	runtimeInputs = [ pkgs.bc ];
	text = builtins.readFile ./volNotify.sh;
})
