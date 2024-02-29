# Flake.nix
# :PROPERTIES:
# :header-args: :tangle flake.nix :comments org
# :END:

# The flake.nix is the over-arching control point for the configuration. It is responsible for gathering the various package sources and applying the correct configuration for each machine.


{
  description = "Machine Configuration Flake";



# These inputs provide the channels the flake will consume

inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  home-manager.url = "github:nix-community/home-manager/release-23.11";
  darwin.url = "github:lnl7/nix-darwin";
  darwin.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = { self, nixpkgs, home-manager, darwin, ... }: {



# Configuration for the Mechanical Orchard work Macbook

darwinConfigurations."Zells-MacBook-Pro" = darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  modules = [
    home-manager.darwinModules.home-manager
    ./hosts/Zells-MacBook-Pro/default.nix
   ];
 };
};

}
