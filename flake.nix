{
  description = "Machine Configuration Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    wezterm-flake = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lexical.url = "github:lexical-lsp/lexical";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      darwin,
      wezterm-flake,
      lexical,
      ...
    }:
    {
      darwinConfigurations."Zells-MacBook-Pro" = darwin.lib.darwinSystem rec {
        system = "aarch64-darwin";
        modules = import ./home-manager/default.nix {
          inherit home-manager;
          homeDirectory = "/Users/zell";
          user = "zell";
          email = "zoe.gagnon@mechanical-orchard.com";
          pkgs = nixpkgs.legacyPackages.${system};
          extraPackages = {
            lexical = lexical.packages.${system}.default;
            wezterm = wezterm-flake.packages.${system}.default;
          };
        };
      };
      darwinConfigurations."Zoes-MacBook-Pro" = darwin.lib.darwinSystem rec {
        system = "x86_64-darwin";
        modules = import ./home-manager/default.nix {
          inherit home-manager;
          homeDirectory = "/Users/zoe";
          user = "zoe";
          email = "zoe@zgagnon.com";
          pkgs = nixpkgs.legacyPackages.${system};
          extraPackages = {
            wezterm = wezterm-flake.packages.${system}.default;
          };
        };
      };
    };
}
