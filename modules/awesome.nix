{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pamixer
    playerctl
    maim
    networkmanager
    gobjectIntrospection
    rofi
    picom-ibhagwan
    xclip
  ];

  # Don't enable this while we're still starting picom manually!
  # services.picom = {
  #   enable = true;
  #   package = pkgs.picom-ibhagwan;
  # };
}
