{ config, pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [

    ghostty xdg-user-dirs gsettings-desktop-schemas
    adwaita-icon-theme nautilus transmission_4-gtk
    celluloid adwaita-fonts nautilus dconf-editor
    google-chrome noctalia-greeter xdg-desktop-portal-gnome  
    android-tools 
  ];

  programs.niri.enable = true;

  programs.noctalia.enable = true;
  programs.noctalia.recommendedServices.enable = true;

  services.greetd.enable = true;

  services.greetd.settings = 
    {
      default_session = {
        command = "noctalia-greeter-session";
       };
    };
  services.gvfs.enable = true;

}
