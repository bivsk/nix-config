{ pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./terminal
    ./wayland
  ];

  home.packages = with pkgs; [
    # media/gfx
    gimp

    # social
    vesktop
    telegram-desktop
  ];

  programs = {
    mpv = {
      enable = true;
    };
  };
}
