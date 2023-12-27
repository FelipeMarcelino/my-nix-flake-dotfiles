{ pkgs, writeShellApplication, ...}: 

writeShellApplication {
   name = "volNotify";
   text = builtins.readFile ./volNotify.sh;
}
