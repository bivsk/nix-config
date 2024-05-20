{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./easyeffects.nix
    ./gui
  ];

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
    fastfetch
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

    htop
    btop
    iotop
    iftop
    nvtop

    # system tools
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
  ];

  programs.git = {
    enable = true;
    userName = "bivsk";
    userEmail = "bivsk@tutanota.com";
  };

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
