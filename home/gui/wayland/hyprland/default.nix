{
  pkgs,
  lib,
  ...
}: let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';

  brillo = lib.getExe pkgs.brillo;
in {
  imports = [
    ./hyprland.nix
    ./waybar
  ];

  home.packages = with pkgs; [
    # hypr
    hyprpaper
    hyprpicker

    # wayland tools
  ];

  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = lib.getExe pkgs.hyprlock;
          before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        };
        listener = [
          # dim screen...
          {
            timeout = 600; # 10min
            on-timeout = "${brillo} -O; ${brillo} -u 1000000 -S 0.3";
            on-resume = "${brillo} -I -u 500000";
          }
          # ..then lock and suspend
          {
            timeout = 900; # 15min
            on-timeout = suspendScript.outPath;
          }
        ];
      };
    };

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

  programs = {
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          hide_cursor = false;
          no_fade_in = true;
        };
        background = {
          monitor = "";
          path = "/home/four/.wallpaper.jpg";
          blur_passes = 2;
          blur_size = 4;
        };
        input-field = [
          {
            monitor = "eDP-1";
            size = "300, 50";
            outline_thickness = 1;

            outer_color = "rgb(151515)";
            inner_color = "rgb(200, 200, 200)";
            font_color = "rgb(10, 10, 10)";

            fade_on_empty = false;
            placeholder_text = "> Password...";

            dots_spacing = 0.2;
            dots_center = true;
          }
        ];
        label = [
          {
            monitor = "";

            text = "$TIME";
            font_size = 50;

            position = "0, 80";
            valign = "center";
            halign = "center";
          }
        ];
      };
    };
  };
}
