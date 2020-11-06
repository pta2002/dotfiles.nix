{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ll -l";
      vi = "nvim";
      vim = "nvim";
    };
  };
}
