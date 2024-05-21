{inputs, ...}: {
  # Enable easyeffects daemon
  services.easyeffects.enable = true;
  services.easyeffects.preset = "lappy_mctopface";

  # Install Framework presets
  xdg.configFile."easyeffects/output".source = inputs.framework-audio-presets.outPath;
}
