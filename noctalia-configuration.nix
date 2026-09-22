{ config, pkgs, inputs, ... }:
{
  #imports = [ inputs.umbriel.nixosModules.default ];
  environment.systemPackages = with pkgs; [

    ghostty xdg-user-dirs gsettings-desktop-schemas
    adwaita-icon-theme adwaita-fonts dconf-editor
    noctalia-greeter android-tools xwayland-satellite     
    nautilus
  ];

  programs.niri.enable = true;
  programs.niri.useNautilus = true;

  # programs.umbriel.enable = true;
  # programs.umbriel.portalPackage = pkgs.xdg-desktop-portal-umbriel;

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
  # services.gnome.gnome-keyring.enable = true;
  # security.pam.services.login.enableGnomeKeyring = true;
  # programs.seahorse.enable = true;
  

}
