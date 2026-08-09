{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./user-configuration.nix
      ./noctalia-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "pcalex";
  networking.wireless.enable = true;  
  networking.networkmanager.enable = true;
  # networking.networkmanager.wifi.backend = "iwd";

  hardware.bluetooth.enable = true;

  time.timeZone = "America/Bogota";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "es_CO.UTF-8";

  security.sudo.wheelNeedsPassword = false;

  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  console.keyMap = "la-latin1";

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #services.libinput.touchpad.accelStepScroll = 0.2;

  fonts = {
    enableDefaultPackages = true;
    #fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      cache32Bit = false;
      hinting.autohint = false;
      hinting.enable = true;
      hinting.style = "slight";
      subpixel.lcdfilter = "light";
      subpixel.rgba = "rgb";
    };
    packages = with pkgs; [
      adwaita-fonts
      liberation_ttf
    ];
    enableGhostscriptFonts = true;
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Adwaita Sans" ];
      monospace = [ "Adwaita Mono" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    unrar p7zip aria2 dos2unix bash-completion 
    ntfs3g exfat exfatprogs distrobox unzip 
    efibootmgr android-tools devenv podman-compose 
    zip unrar git gh e2fsprogs xfsprogs eza dysk ncdu
  ];

  
  

  networking.firewall.enable = false;

  system.stateVersion = "26.05"; 

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver 
      libvdpau-va-gl
    ];
  };
  
  environment.shellAliases = {
    ll = "ls -lh";
    la = "ls -lha";
    o = "less";
    nano = "nano -wl";
    df = "df -h";
    free = "free -h";
    battery = "upower -i $(upower -e | grep 'battery') | grep percentage";
  };

  services.earlyoom.enable = true;
  
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
      dockerSocket.enable = true;
    };
  };

  virtualisation.containers.registries.settings= {
    registry = [
      { location = "docker.io"; }
      { location = "quay.io"; }
     ];
  };

  #services.flatpak.enable = true;
  #xdg.portal.enable = true;


  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  programs.nix-index.enable = true;
  programs.command-not-found.enable = false;

  # services.upower.enable = true;     

  programs.nix-ld.enable = true;

  services.tuned = {
    enable = true;
    ppdSupport = true;
  };
  

}

