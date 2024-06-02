{
  description = "NixOS Configurations";

  inputs = {
    # TODO: enable both stable and unstable nixpkgs throughout the config
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprcursor-phinger.url = "github:Jappie3/hyprcursor-phinger";

    framework-audio-presets = {
      url = "github:ceiphr/ee-framework-presets";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # NixOS configuration entrypoint
    nixosConfigurations = {
      kagome = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/four-kagome
	  nixos-hardware.nixosModules.framework-13-7040-amd
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    homeConfigurations = {
      "four@kagome" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home
          ./home/gui
          ./home/tui
        ];
      };
    };
  };
}
