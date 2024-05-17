{
  config,
  pkgs,
  ...
}: {

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs.home-manager.enable = true;

  home.username = "four";
  home.homeDirectory = "/home/four";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    rofi-wayland
    neovim
    #fastfetch
    nnn

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    jq
    eza
    fzf

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    nix-output-monitor

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    #nvtop

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,1.5";

      input = {
        kb_layout = "us";
        kb_options = "ctrl:nocaps";
        numlock_by_default = true;
        repeat_rate = 30;
        repeat_delay = 350;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        border_size = 2;
        no_border_on_floating = false;
        gaps_in = 5;
        gaps_out = 10;
        cursor_inactive_timeout = 5;
      };

      decoration = {
        rounding = 5;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 4; # size
        shadow_render_power = 3; # more power, faster the falloff [1-4]
        dim_inactive = true;
        dim_strength = 0.1;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
          xray = false; # dependent on above, decreases overhead
          special = false; # expensive
        };
      };

      # Binds
      "$mod" = "SUPER";
      bind =
        [
          "$mod SHIFT, return, exec, alacritty"
          "$mod SHIFT, C, killactive"
          "$mod SHIFT, E, exit"
          "$mod, F, fullscreen"
          "$mod SHIFT, F, fakefullscreen"
          "$mod, space, togglefloating"
          "$mod, F, exec, firefox"
          "$mod, P, exec, rofi -show drun"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..0} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );

      # move/resize windows using mouse
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      # media keys
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
    };
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "bivsk";
    userEmail = "bivsk@tutanota.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.firefox.enable = true;

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.mpv.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";
}
