# Basic user stuff, programs, etc.
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Entertainment
    spotify
  ];
}
