{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "pta2002";
  home.homeDirectory = "/home/pta2002";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  home.packages = with pkgs; [
    git
    ninja
    ripgrep
    direnv

    gcc gdb
    gnumake

    zoom-us
    emacs

    vlc

    libqalculate
    libreoffice

    texlive.combined.scheme-medium

    # Mathematica should probably be installed through nix-env
    # mathematica
    qbittorrent
    kicad-small

    darktable
  ];
  home.sessionVariables = { EDITOR = "nvim"; };

  user.colorscheme = {
    color0 = "#282828";
    color1 = "#cc241d";
    color2 = "#98971a";
    color3 = "#d79921";
    color4 = "#458588";
    color5 = "#b16286";
    color6 = "#689d6a";
    color8 = "#928374";
    color7 = "#a89984";
    color9 = "#fb4934";
    color10 = "#b8bb26";
    color11 = "#fabd2f";
    color12 = "#83a598";
    color13 = "#d3869b";
    color14 = "#8ec07c";
    color15 = "#ebdbb2";


    vimPlugin.plugin = pkgs.vimPlugins.gruvbox;
    vimPlugin.config = ''
      colorscheme gruvbox
      let g:lightline = { 'colorscheme': 'gruvbox' }
    '';
  };

  imports = [
    ./modules/git.nix
    ./modules/fish.nix
    ./modules/kitty.nix
    ./modules/awesome.nix
    ./modules/theme.nix
    ./modules/zathura.nix
    ./modules/starship.nix
    ./modules/nvim

    ./modules/colorscheme.nix

    ./user.nix
    ./machines/mercury.nix
  ];
}
