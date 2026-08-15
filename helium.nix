{ config, pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.helium.overlays.default ];

  environment.systemPackages = with pkgs;  [ helium ];
}
