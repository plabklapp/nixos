{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    ghostty xdg-user-dirs gsettings-desktop-schemas 
    adwaita-icon-theme nautilus transmission_4-gtk 
    celluloid adwaita-fonts dconf-editor google-chrome
  ];

  services.gvfs.enable = true;
  
  programs.niri.enable = true;

  # programs.mangowc.enable = true;

  
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri"; 
    configHome = "/home/alex";
   };
   

  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
   };
    enableSystemMonitoring = true;
    #enableVPN = false;
    enableDynamicTheming = true;
  };


  programs.dsearch = {
    enable = true;
    systemd.enable = true;
  };


  programs.dconf.enable = true;


}

