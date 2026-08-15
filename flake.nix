{
  description = "pcalex flake";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		helium = { 
			url = "github:schembriaiden/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

  outputs = { self, nixpkgs, helium, ... }@inputs: {
    nixosConfigurations.pcalex = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
 	system = "x86_64-linux";
	modules = [ ./configuration.nix ];
    };
  };

}

