{ config, pkgs, ... }:

{

nixpkgs.overlays = [
    (self: super: {
      google-chrome = super.google-chrome.override {
        commandLineArgs = [
          "--enable-features=TouchpadOverscrollHistoryNavigation" 
        ];
      };
    })
   ];

  environment.systemPackages = with pkgs; [ google-chrome ];

}
