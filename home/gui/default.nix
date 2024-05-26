{pkgs, ...}: {
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

    # misc
    libnotify
  ];

  programs = {
    mpv = {
      enable = true;
    };
  };
}
