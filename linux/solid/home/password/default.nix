{ config, pkgs, ...}:
{
   # Keyring/Password Manager
   services.gnome-keyring.enable = true;
   services.gnome-keyring.components = ["pkcs11" "secrets" "ssh"];
   programs.rbw.enable = true;
   programs.rbw.settings.pinentry = "curses";
   programs.rbw.settings.email = "felipe.marcelino1991@gmail.com";
   programs.rbw.settings.base_url = "https://api.bitwarden.com/";
   programs.rbw.settings.identity_url = "https://identity.bitwarden.com/";

   home.packages = [
	pkgs.bitwarden-cli
	pkgs.libsecret
   ];
}

