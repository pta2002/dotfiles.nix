{ config, lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font.package = pkgs.jetbrains-mono;
    font.name = "JetBrains Mono";

    settings = {
      font_size = "12.0";
      background = "#282828";

      foreground = "#ebdbb2";
      cursorColor = "#ebdbb2";

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

      background_opacity = "0.5";
      window_padding_width = "5";
    };
  };
}
