{
  programs.yazi = {
    enable = true;
    #package = yazi.packages.${pkgs.system}.default;
    # change working directory when exiting Yazi
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };
}
