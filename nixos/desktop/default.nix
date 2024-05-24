{lib, ...}: {
  imports = [
    ./sound.nix
    ./backlight.nix
    ./bluetooth.nix
  ];

  security.pam.services.hyprlock.text = "auth include login";

  # Power management
  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "powersave";
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
