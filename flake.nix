{
  description = "Mac Machine Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, darwin }: {
   
   darwinConfigurations."Zells-MacBook-Pro" = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      home-manager.darwinModules.home-manager 
      ./hosts/Zells-MacBook-Pro/default.nix
     ];
   };
  };
}
