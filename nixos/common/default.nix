{pkgs, ...}:
{
  imports = [
    ./boot.nix
    ./network.nix
    ./ssh.nix
    ./users.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  security.sudo.package = pkgs.sudo.override { withInsults = true; };
  documentation.dev.enable = true;

  #time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # userland niceness
  security.rtkit.enable = true;
}
