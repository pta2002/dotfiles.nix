{ config, lib, pkgs, ... }:
let
  iosevka-term = pkgs.iosevka.override (attrs: {
    set = "term";

    privateBuildPlan = {
      family = "Iosevka Term";
    };
  });
in
{
  imports = [
    ./colorscheme.nix
  ];

  fonts.fontconfig.enable = true;

  programs.kitty = {
    enable = true;
#    font.package = iosevka-term;
#    font.name = ''Iosevka Term'';

    settings = {
      font_size = "16.0";

      # This is EXTREMELY annoying when compiling something with lots of warnings...
      enable_audio_bell = "no";

      bold_font = "Iosevka Term Bold";
      italic_font = "Iosevka Term Italic";
      bold_italic_font = "Iosevka Term Bold Italic";

      symbol_map = "U+E0A0 Hack Nerd Font";

      foreground = config.user.colorscheme.color15;
      background = config.user.colorscheme.color0;

      color0 = config.user.colorscheme.color0;
      color1 = config.user.colorscheme.color1;
      color2 = config.user.colorscheme.color2;
      color3 = config.user.colorscheme.color3;
      color4 = config.user.colorscheme.color4;
      color5 = config.user.colorscheme.color5;
      color6 = config.user.colorscheme.color6;
      color7 = config.user.colorscheme.color7;
      color8 = config.user.colorscheme.color8;
      color9 = config.user.colorscheme.color9;
      color10 = config.user.colorscheme.color10;
      color11 = config.user.colorscheme.color11;
      color12 = config.user.colorscheme.color12;
      color13 = config.user.colorscheme.color13;
      color14 = config.user.colorscheme.color14;
      color15 = config.user.colorscheme.color15;

      disable_ligatures = "always";

      background_opacity = "0.5";
      window_padding_width = "5";
    };
  };
}
