{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./core
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs.home-manager.enable = true;

  home.username = "four";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    rofi-wayland
    neovim
    nnn
  ];

  programs.firefox.enable = true;

  programs.mpv.enable = true;

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
