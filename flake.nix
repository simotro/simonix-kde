{
  description = "Simonix - KDE Plasma";

  inputs = {
    # Usiamo nixos-unstable per le ultime novità di Plasma 6.6 e Kernel 6.14+
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }@inputs: {
    nixosConfigurations.vm-test = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; # Passa i flake inputs a tutti i moduli
      modules = [
        ./hosts/vm-test/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
          home-manager.users.simone = import ./modules/home.nix;
        }
      ];
    };
  };
}
