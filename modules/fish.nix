{ pkgs, ... }:
{
  # Makes nix-shell use fish
  home.packages = [ pkgs.any-nix-shell ];

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
    };

    interactiveShellInit = ''
      set fish_greeting
    '';

    promptInit = ''
      any-nix-shell fish | source
    '';
  };
}
