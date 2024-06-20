{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
	font_size = 12;
        color_scheme = "Everforest Dark (Gogh)",
      }
    '';
  };
}
