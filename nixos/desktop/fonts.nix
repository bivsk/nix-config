{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
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

    fontconfig.defaultFonts = let
      addAll = builtins.mapAttrs (k: v: ["Symbols Nerd Font"] ++ v ++ ["Noto Color Emoji"]);
    in
      addAll {
        serif = ["Noto Serif"];
        sansSerif = ["Inter"];
        monospace = ["JetBrains Mono"];
        emoji = [];
      };
  };
}
