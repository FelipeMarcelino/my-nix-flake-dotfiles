{ config, pkgs, ...}:
{
   # Keyring/Password Manager
   services.gnome-keyring.enable = true;
   programs.rbw.enable = true
   programs.rbw.settings.email = "felipe.marcelino1991@gmail.com";
}

