# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixos/common
    ../../nixos/desktop
  ];

  boot.initrd.luks.devices."luks-5fd805ab-c1dd-4ab7-8e47-c029d4e30996".device = "/dev/disk/by-uuid/5fd805ab-c1dd-4ab7-8e47-c029d4e30996";
  networking.hostName = "kagome"; # Define your hostname.

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [
      pkgs.rocmPackages.clr.icd
      pkgs.amdvlk
      # encoding/decoding
      pkgs.libvdpau-va-gl
      pkgs.vaapiVdpau
    ];
    extraPackages32 = [
      pkgs.driversi686Linux.amdvlk
    ];
  };

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  powerManagement.powertop.enable = true;
  systemd.services.battery-limit.postStart = ''
    ${pkgs.ectool}/bin/ectool fwchargelimit 85
  '';

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.fprintd.enable = true;

  services.fwupd.enable = true;
  services.fwupd.extraRemotes = [ "lvfs-testing" ];

  # Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  environment.systemPackages = with pkgs; [
    git

    # Archives
    p7zip
    unzipNLS
    xz
    zip
    zstd

    # Text processing
    gawk
    gnugrep
    gnused
    jq

    # Net
    aria2
    curl
    nmap
    socat
    wget
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
