{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = hyprpaper
    '';
    settings = {
      monitor = ",preferred,auto,1.56667";

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
}
