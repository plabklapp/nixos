{ config, pkgs, ... }:

{
  users.users.alex = {
    isNormalUser = true;
    description = "alex";
    extraGroups = [ "networkmanager" "wheel" "podman" ];
    subUidRanges = [ { startUid = 100000; count = 65536; } ];
    subGidRanges = [ { startGid = 100000; count = 65536; } ];
    packages = with pkgs; [  ];
  };
}


