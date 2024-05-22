{pkgs, ...}: {
  imports = [
    ./hyprland.nix
  ];

  home.packages = with pkgs; [
    # hypr
    hyprpaper
    hyprpicker

    # wayland tools
    brightnessctl
  ];

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = ["/home/four/.wallpaper.jpg"];

        wallpaper = ["eDP-1,/home/four/.wallpaper.jpg"];
      };
    };
  };
}
