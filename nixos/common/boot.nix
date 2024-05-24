{
  lib, 
  pkgs,
  ...
}: {
  boot = {

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4"];
    };

    # latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      # systemd-boot on EFI
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = lib.mkDefault 10;
        #consoleMode = lib.mkDefault "max";
      };
    };

    plymouth.enable = true;
  };
}
