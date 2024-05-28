{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./terminal
    ./wayland
  ];

  home.packages = with pkgs; [
    brave

    # media/gfx
    gimp
    spotify

    # social
    vesktop
    telegram-desktop

    # misc
    libnotify
  ];

  programs = {
    mpv = {
      enable = true;
    };
  };

  services = {
    gammastep = {
      enable = true;
      tray = true;
      provider = "geoclue2";
      temperature.day = 5500;
      temperature.night = 3300;
    };
  };
}
