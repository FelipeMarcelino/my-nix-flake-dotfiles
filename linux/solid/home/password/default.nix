{ config, pkgs, ...}:
{
   # Keyring/Password Manager
   services.gnome-keyring.enable = true;
   programs.rbw.enable = true;
   programs.rbw.settings.email = "felipe.marcelino1991@gmail.com";
   programs.rbw.settings.base_url = "https://api.bitwarden.com/";
   programs.rbw.settings.identity_url = "https://identity.bitwarden.com/";
}

