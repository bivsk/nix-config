{ lib, ... }: {
  home.file.".config/waybar/assets/nix-logo.svg".source = ./assets/nix-logo.svg;

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      primary = {
        layer = "top";
	position = "top";
	height = 30;
	spacing = 4;

	modules-left = [ "image" "hyprland/workspaces" "hyprland/window" ];
	modules-center = [ "clock" ];
	modules-right = [
	  "network"
	  "power-profiles-daemon"
	  "cpu"
	  "memory"
	  "temperature"
	  "backlight"
	  "battery"
	  "tray"
	];

	"image" = {
	  path = "/home/four/.config/waybar/assets/nix-logo.svg";
	  size = 14;
	};

	"hyprland/workspaces" = {
          format = "{icon}";
          all-outputs = false;
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };
        };
      };
    };

    style = lib.concatStrings [''
      * {
        font-size: 12px;
	font-family: Inter, Material Icons;
	min-height: 0;
      }
      window#waybar {
	background: #1E2326;
	border: 2px solid #3C4841;
	color: #D3C6AA;
        margin: 6px;
	padding: 2px 8px;
      }
      #image {
        margin: 0px 16px;
      }
    ''];
  };
}
