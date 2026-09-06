{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus ptyxis google-chrome transmission_4-gtk celluloid
    gnome-extension-manager
  ];

 services = {
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  
  gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };
 };

 environment.gnome.excludePackages = with pkgs; [
   gnome-tour gnome-user-docs gnome-console
 ];

}

