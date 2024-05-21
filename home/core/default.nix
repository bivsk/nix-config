{config, ...}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in rec {
  imports = [
    ./shells
    ./git.nix
  ];

  home.homeDirectory = "/home/four";

  # environment vars set at login
  home.sessionVariables = {
    # clean up ~/
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    # default apps
    BROWSER = "firefox";
  };
}
