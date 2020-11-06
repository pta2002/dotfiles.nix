# GTK theme stuff
{ pkgs, ... }:
{
  xsession.pointerCursor = {
    package = pkgs.gnome3.gnome_themes_standard;
    name = "Adwaita";
    size = 24;
  };
}
