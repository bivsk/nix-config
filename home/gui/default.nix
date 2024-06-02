{inputs,config,pkgs,lib, ...}: {
  imports = [
    ./audio.nix
    ./terminal
    ./wayland
    ./polkit-agent.nix
  ];

  home.packages = with pkgs; [
    brave

    # media/gfx
    gimp
    spotify
    zathura
    qbittorrent

    # social
    vesktop
    telegram-desktop

    # crypto
    ledger-live-desktop
    trezor-suite

    # misc
    libnotify
  ];

  gtk = {
    enable = true;
    
    font = {
      name = "uzura_font";
      package = inputs.self.packages.${pkgs.system}.uzura;
      size = 10;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

  programs = {
    mpv = {
      enable = true;
    };
    qutebrowser = {
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

    kdeconnect = {
      enable = true;
      indicator = true;
    };

    udiskie = {
      enable = true;
      tray = "auto"; # always, auto, never
    };
  };
}
