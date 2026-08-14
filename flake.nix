{
  description = "pcalex flake";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		helium.url = "github:oxcl/nix-flake-helium-browser";
	};

  outputs = { self, nixpkgs, helium, ... }@inputs: {
    nixosConfigurations.pcalex = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
 	system = "x86_64-linux";
	modules = [ ./configuration.nix ];
    };
  };

}

