{
  description = "Machine Configuration Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    emacsng.url = "github:emacs-ng/emacs-ng";
  };
  outputs = { self, nixpkgs, home-manager, darwin, emacsng, ... }: {
   darwinConfigurations."Zells-MacBook-Pro" = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      home-manager.darwinModules.home-manager
      ./hosts/Zells-MacBook-Pro/default.nix
     ];
   };
   darwinConfigurations."Zoes-MacBook-Pro" = darwin.lib.darwinSystem {
    system = "x86_64-darwin";
    modules = [
      home-manager.darwinModules.home-manager
      ./hosts/Zoes-MacBook-Pro/default.nix
     ];
   };
  };
}
