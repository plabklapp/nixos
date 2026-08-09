{ config, pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [

    ghostty xdg-user-dirs gsettings-desktop-schemas
    adwaita-icon-theme nautilus transmission_4-gtk
    celluloid adwaita-fonts nautilus dconf-editor
    google-chrome noctalia-greeter xdg-desktop-portal-gnome  
  ];

  programs.noctalia.enable = true;

  programs.niri.enable = true;

  services.greetd.enable = true;

  services.greetd.settings = 
    {
      default_session = {
        command = "noctalia-greeter-session";
       };
    };

}
