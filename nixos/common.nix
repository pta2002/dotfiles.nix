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

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.wacom.enable = true;

  services.xserver.layout = "pt";

  sound.enable = true;
  # PipeWire!
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # sessionManager = "${pipewire}/bin/pipewire-media-session";
  };
  # hardware.pulseaudio.enable = true;

  programs.fish.enable = true;
  users.users.pta2002 = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ];
  };

  environment.systemPackages = [ pkgs.firefox pkgs.manpages ];

  documentation.dev.enable = true;

  programs.steam.enable = true;

  # Pretty sudo
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # Pretty boot screen
  boot.plymouth.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", TAG+="uaccess", MODE="0666"
    KERNEL=="hiddev*", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", TAG+="uaccess", MODE="0666"
    SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", TAG+="uaccess", MODE="0666"
  '';

  ## Wireguard shenanigans
  #networking.firewall = {
  #  allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  #};
  ## Enable Wireguard
  #networking.wireguard.interfaces = {
  #  # "wg0" is the network interface name. You can name the interface arbitrarily.
  #  wg0 = {
  #    # Determines the IP address and subnet of the client's end of the tunnel interface.
  #    ips = [ "10.100.0.2/24" ];
  #    listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

  #    # Path to the private key file.
  #    #
  #    # Note: The private key can also be included inline via the privateKey option,
  #    # but this makes the private key world-readable; thus, using privateKeyFile is
  #    # recommended.
  #    privateKeyFile = "/home/pta2002/wireguard/private";

  #    peers = [
  #      # For a client configuration, one peer entry for the server will suffice.

  #      {
  #        # Public key of the server (not a file path).
  #        publicKey = "cD5p4SzhWxpWm1R4GRygrf4muwAgaE6T3bJQcjdpuAY=";

  #        # Forward all the traffic via VPN.
  #        allowedIPs = [ "0.0.0.0/0" ];
  #        # Or forward only particular subnets
  #        #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

  #        # Set this to the server IP and port.
  #        endpoint = "pta2002.com:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

  #        # Send keepalives every 25 seconds. Important to keep NAT tables alive.
  #        persistentKeepalive = 25;
  #      }
  #    ];
  #  };
  #};
}
