{ config, pkgs, ...}:

pkgs.writeShellApplication
{
   name = "volNotify"
   runtimeInputs = [ bc coreutils ];
   text = builtins.readFile ./volNotify.sh;
}
