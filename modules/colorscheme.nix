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

  config = let
    trim = s: concatStrings (builtins.tail (stringToCharacters s));
  in {
    programs.fish.interactiveShellInit = ''
      if [ $TERM = "linux" ]
        echo -en "\e]P0${trim config.user.colorscheme.color0}"
        echo -en "\e]P1${trim config.user.colorscheme.color1}"
        echo -en "\e]P2${trim config.user.colorscheme.color2}"
        echo -en "\e]P3${trim config.user.colorscheme.color3}"
        echo -en "\e]P4${trim config.user.colorscheme.color4}"
        echo -en "\e]P5${trim config.user.colorscheme.color5}"
        echo -en "\e]P6${trim config.user.colorscheme.color6}"
        echo -en "\e]P7${trim config.user.colorscheme.color7}"
        echo -en "\e]P8${trim config.user.colorscheme.color8}"
        echo -en "\e]P9${trim config.user.colorscheme.color9}"
        echo -en "\e]Pa${trim config.user.colorscheme.color10}"
        echo -en "\e]Pb${trim config.user.colorscheme.color11}"
        echo -en "\e]Pc${trim config.user.colorscheme.color12}"
        echo -en "\e]Pd${trim config.user.colorscheme.color13}"
        echo -en "\e]Pe${trim config.user.colorscheme.color14}"
        echo -en "\e]Pf${trim config.user.colorscheme.color15}"
      end
    '';
  };
}
