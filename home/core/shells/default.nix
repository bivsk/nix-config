{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # system monitoring
    htop
    btop
    iotop
    iftop
    nvtopPackages.amd
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils

    # nix
    nix-output-monitor
    hydra-check # Check hydra for build status of a package
    nix-index # Index store paths
    nix-init # Generate nix derivation from url
    nix-melt # TUI flake.lock viewer
    nix-tree # TUI to visualize dependency graph of a nix derivation

    # utils
    ripgrep
    jq
    eza
    fd
    fzf
    duf
    du-dust

    # misc
    cowsay
    fastfetch
    file
    gawk
    gnupg
    gnused
    gnutar
    tree
    which
    zstd
  ];

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        export PATH="$HOME/.local/bin:$PATH"
      '';
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
    };

    # a cat(1) clone with syntax highlighting and Git integration
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        #theme = "";
      };
    };
  };
}
