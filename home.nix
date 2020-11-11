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

  programs.neovim = {
    enable  = true;
    package = pkgs.neovim-nightly;

    viAlias  = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    git
    ninja

    gcc

    zoom-us
    emacs

    libqalculate
  ];
  home.sessionVariables = { EDITOR = "nvim"; };

  imports = [
    ./modules/git.nix
    ./modules/fish.nix
    ./modules/kitty.nix
    ./modules/awesome.nix
    ./modules/theme.nix
    ./modules/zathura.nix
    ./modules/starship.nix
    ./user.nix

    ./machines/mercury.nix
  ];
}
