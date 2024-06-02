{
  # Ledger UDEV rules. Requires plugdev group to exist
  hardware.ledger.enable = true;
  users.groups.plugdev = {};

  # Enable Trezor bridge
  services.trezord.enable = true;
}
