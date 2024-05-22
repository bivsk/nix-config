{ pkgs, ... }:
{
  imports = [
    ./hyprland
  ];

  home.packages = with pkgs; [
    brightnessctl
  ];
}
