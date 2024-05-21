{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      mouse.hide_when_typing = true;
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      window = {
        opacity = 1.0;
        dynamic_padding = false;
        padding = {
          x = 8;
          y = 8;
        };
      };
      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
        vi_mode_style = {
          shape = "Block";
          blinking = "On";
        };
        blink_timeout = 0;
      };
    };
  };
}
