{ pkgs, ... }:
{
  # Enable networking
  networking.networkmanager.enable = true;
  services.resolved.enable = true; # req. by mullvad
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
