{ config, pkgs, lib, ... }:
with lib;
let
  colorOption = mkOption {
    type = types.str;
    default = "";
    description = "A color on the palette";
  };
in
{
  options = {
    user.colorscheme = {
      color0 = colorOption;
      color1 = colorOption;
      color2 = colorOption;
      color3 = colorOption;
      color4 = colorOption;
      color5 = colorOption;
      color6 = colorOption;
      color7 = colorOption;
      color8 = colorOption;
      color9 = colorOption;
      color10 = colorOption;
      color11 = colorOption;
      color12 = colorOption;
      color13 = colorOption;
      color14 = colorOption;
      color15 = colorOption;

      vimPlugin = {
        plugin = mkOption {
          type = types.package;
          description = "vim plugin";
        };

        config = mkOption {
          type = types.lines;
          description = "vimscript for this plugin";
          default = "";
        };
      };
    };
  };
}
