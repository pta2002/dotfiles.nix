{ config, pkgs, lib, ... }:
with lib;
let
  colorOption = mkOption {
    type = types.string;
    default = "";
    description = "A color on the palette";
  };

  colorschemeOption = types.submodule {
    options = {
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

      vimPlugin = types.submodule {
        options = {
          plugin = mkOption {
            type = types.package;
            description = "vim plugin";
          };

          config = mkOption {
            type = type.lines;
            description = "vimscript for this plugin";
            default = "";
          };
        };
      };
    };
  };
in
{
  options = {
    colorscheme = colorschemeOption;
  };
}
