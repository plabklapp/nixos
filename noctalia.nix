{ inputs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;

    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;
  };

  programs.noctalia-greeter = {
    enable = true;

    # Optional configuration
    greeter-args = "";
    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
        #path = "${pkgs.bibata-cursors}/share/icons";
      };
      keyboard = {
        layout = "latam";
      };
    };

    environment.systemPackages = with pkgs; [

      alacritty xdg-user-dirs gsettings-desktop-schemas
      adwaita-icon-theme nautilus transmission_4-gtk
      celluloid adwaita-fonts nautilus
      transmission_4-gtk celluloid dconf-editor
    ];

  programs.niri.enable = true;

};

}
