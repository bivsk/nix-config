{inputs, pkgs, ...}:{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];

      # fix gamescope inside of steam
      package = pkgs.steam.override {
        extraPkgs = pkgs:
	  with pkgs; [
	    keyutils
	    libkrb5
	    libpng
	    libpulseaudio
	    libvorbis
	    stdenv.cc.cc.lib
	    xorg.libXcursor
	    xorg.libXi
	    xorg.libXinerama
	    xorg.libXScrnSaver
	  ];
      };
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "auto";
    	  renice = 15;
        };
      };
    };
  };
}
