{ config, pkgs, ... }:

{
  services.displayManager.plasma-login-manager.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [ elisa discover qrca ];

  environment.systemPackages = with pkgs; [
    qbittorrent haruna
  ];

}

