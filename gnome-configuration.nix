{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus ghostty google-chrome transmission_4-gtk celluloid
    gnome-extension-manager papers loupe file-roller gnome-text-editor 
    resources seahorse
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
  
  services.oo7.enable = true;
  security.pam.services.alex.oo7.enable = true;


}

