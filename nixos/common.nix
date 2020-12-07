# A config file common accross all machines
{ config, pkgs, ... }:
{
  nixpkgs.overlays = [ (import ./overlays/awesome.nix) ];
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome-nightly;
  };

  services.xserver.layout = "pt";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.fish.enable = true;
  users.users.pta2002 = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ];
  };

  environment.systemPackages = [ pkgs.firefox pkgs.manpages ];

  documentation.dev.enable = true;

  # Pretty sudo
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # Pretty boot screen
  boot.plymouth.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
