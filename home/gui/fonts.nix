{ pkgs, ... }: { 
  home.packages = with pkgs; [
    # icons
    material-symbols

    # sans(serif) fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    roboto
    (google-fonts.override {fonts = ["Inter"];})

    # monospace
    jetbrains-mono

    # nerdfonts
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];

  enableDefaultPackages = false;

  fonts.fontconfig = {
    enable = true;
#    defaultFonts = {
#      emoji = 
#    };
  };
}
