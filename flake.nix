{
  description = "pcalex flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
/*
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs"; # this line is optional, prevents downloading two versions of nixpkgs but disables cache
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
*/
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.pcalex = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
 	system = "x86_64-linux";
	modules = [ ./configuration.nix ];
    };
  };

}

