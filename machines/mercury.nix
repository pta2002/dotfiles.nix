{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    acpid acpi
  ];
}
