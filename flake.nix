{
  description = "pcalex flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.pcalex = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
 	system = "x86_64-linux";
	modules = [ ./configuration.nix ];
    };
  };

}

