self: super:
let
  src = {
    owner = "coreemu";
    repo = "core";
    rev = "rel/7.5.2";
    sha256 = "sha256-xIQQX6OzXvZjAD8Br4VHRAIAacmejz3jyLcTJp4rHN4=";
  };

  core-configured = { stdenv, fetchFromGitHub, pkgs }:
  stdenv.mkDerivation {
    version = "7.5.2";
    pname = "core-configured";
    src = fetchFromGitHub src;

    buildInputs = with pkgs; [
      python39
      python39Packages.grpcio-tools
      automake
      autoconf
      procps
      ebtables
      iproute2
      ethtool
      mount
      pkg-config
      libev
      tk
    ];

   configurePhase = ''
      ${pkgs.bash}/bin/bash bootstrap.sh
      ./configure sysctl_path=${pkgs.procps}/bin/sysctl \
                  ebtables_path=${pkgs.ebtables}/bin/ebtables \
                  ip_path=${pkgs.iproute2}/bin/ip \
                  tc_path=${pkgs.iproute2}/bin/tc \
                  ethtool_path=${pkgs.ethtool}/bin/ethtool \
                  mount_path=${pkgs.mount}/bin/mount \
                  umount_path=${pkgs.mount}/bin/umount \
                  --enable-daemon=yes \
                  --prefix=$out
    '';

    installPhase = ''
      cp -r daemon $out
    '';
  };
  core-configured-pkg = pkgs.callPackage core-configured {};

  core-gui = { stdenv, lib, fetchFromGitHub, pkgs, patchelf }:
  stdenv.mkDerivation {
    version = "7.5.2";
    pname = "core-gui";
    src = fetchFromGitHub src;

    buildInputs = with pkgs; [
      # python39
      # python39Packages.grpcio-tools
      automake
      autoconf
      procps
      ebtables
      iproute2
      ethtool
      mount
      pkg-config
      libev
      tk
    ];

    configurePhase = ''
      ${pkgs.bash}/bin/bash bootstrap.sh
      mkdir -p $out
      ./configure sysctl_path=${pkgs.procps}/bin/sysctl \
                  ebtables_path=${pkgs.ebtables}/bin/ebtables \
                  ip_path=${pkgs.iproute2}/bin/ip \
                  tc_path=${pkgs.iproute2}/bin/tc \
                  ethtool_path=${pkgs.ethtool}/bin/ethtool \
                  mount_path=${pkgs.mount}/bin/mount \
                  umount_path=${pkgs.mount}/bin/umount \
                  --enable-daemon=no \
                  --prefix=$out
    '';

    postFixup = ''
      sed -i 's$WISHLIST=".*"$WISHLIST="${pkgs.tk}/bin/wish"$' $out/bin/core-gui
    '';
  };

  core-daemon = { stdenv, lib, fetchFromGitHub, pkgs }:
  stdenv.mkDerivation {
    version = "7.5.2";
    pname = "core-daemon";
    src = fetchFromGitHub src;
    buildInputs = with pkgs; [
      (python39.withPackages (python-packages: [
        # python-packages.grpcio-tools
        (callPackage core-python {})
      ]))
      python39Packages.grpcio-tools
      automake
      autoconf
      procps
      ebtables
      iproute2
      ethtool
      mount
      pkg-config
      libev
      tk
      makeWrapper
      proj
    ];

    propagatedBuildInputs = with pkgs; [
      ebtables
      iproute2
      ethtool
      mount
      libev
      procps
      coreutils
    ];

    configurePhase = ''
      ${pkgs.bash}/bin/bash bootstrap.sh
      mkdir -p $out
      ./configure sysctl_path=${pkgs.procps}/bin/sysctl \
                  ebtables_path=${pkgs.ebtables}/bin/ebtables \
                  ip_path=${pkgs.iproute2}/bin/ip \
                  tc_path=${pkgs.iproute2}/bin/tc \
                  ethtool_path=${pkgs.ethtool}/bin/ethtool \
                  mount_path=${pkgs.mount}/bin/mount \
                  umount_path=${pkgs.mount}/bin/umount \
                  --enable-gui=no \
                  --prefix=$out
    '';

    postInstall = with pkgs; ''
      cp daemon/scripts/* $out/bin
      mv $out/bin/core-daemon $out/bin/core-daemon-unwrapped
      cp -r daemon/data $out/etc

      makeWrapper $out/bin/core-daemon-unwrapped $out/bin/core-daemon \
        --prefix PATH ":" "$out/bin:${iproute2}/bin:${ethtool}/bin:${ebtables}/bin:${procps}/bin:${coreutils}/bin:${mount}/bin:${bash}/bin" \
        --set PROJ_LIB "${proj}/share/proj" \
        --add-flags "-l $out/etc/logging.conf -f $out/etc/core.conf"
    '';
  };

  core-python = { pkgs, fetchFromGitHub }:
  pkgs.poetry2nix.mkPoetryApplication rec {
    # projectDir = /nix/store/hba09vbz7rdp96ypwh48mcgc7lvx309c-core-configured-7.5.2;
    src = core-configured-pkg;
    pyproject = src + "/pyproject.toml";
    poetrylock = src + "/poetry.lock";
  };
  pkgs = import <nixpkgs> {};
in {
  core-gui = pkgs.callPackage core-gui {};
  core-daemon = pkgs.callPackage core-daemon {};
  # core-python = pkgs.callPackage core-python {};
}
