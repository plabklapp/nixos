{
  description = "pcalex flake";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	/*	helium = { 
			url = "github:schembriaiden/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		}; */
                umbriel.url = "git+https://github.com/noctalia-dev/umbriel";
	};

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.pcalex = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
 	system = "x86_64-linux";
	modules = [ ./configuration.nix ];
    };
  };

}

