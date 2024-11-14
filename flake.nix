{
  description = "Machine Configuration Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    emacsng.url = "github:emacs-ng/emacs-ng";
    wezterm-flake = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      darwin,
      emacsng,
      wezterm-flake,
      ...
    }:
    {
      darwinConfigurations."Zells-MacBook-Pro" = darwin.lib.darwinSystem rec {
        system = "aarch64-darwin";
        modules = import ./hosts/Zells-MacBook-Pro/default.nix {
          inherit home-manager;
          pkgs = nixpkgs.legacyPackages.${system};
          extraPackages = {
            wezterm = wezterm-flake.packages.${system}.default;
          };
        };
        # modules = [
        #   home-manager.darwinModules.home-manager
        #   {
        #     home-manager.extraSpecialArgs = {
        #       wezterm = wezterm-flake.packages.${system}.wezterm;
        #     };
        #   ./hosts/Zells-MacBook-Pro/default.nix {
        #       wezterm = wezterm-flake.packages.${system}.wezterm;
        #   }
        # ];
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
