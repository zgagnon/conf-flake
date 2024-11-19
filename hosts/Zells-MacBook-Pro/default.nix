{
  pkgs,
  extraPackages,
  home-manager,
  ...
}@inputs:
let
  homeDirectory = "/Users/zell";
  system = import ../../system "zell" inputs;
  mac = import ../../os/mac;
  homebrewPackages = import ./homebrew.nix;
  homebrew = import ../../new-progs/homebrew.nix homebrewPackages;
  lib = pkgs.lib;
  user = "zell";
in
[
  system
  mac
  homebrew
  home-manager.darwinModules.home-manager
  {
    imports = [
      (import ../../new-progs/onep.nix {
        inherit homeDirectory lib pkgs;
        user = "zell";
      })
      (import ../../new-progs/git.nix {
        inherit lib pkgs homeDirectory;
        gitmessage = ./.gitmessage;
        email = "zoe.gagnon@mechanical-orchard.com";
        user = "zell";
      })
      (import ../../new-progs/paperwm.nix { inherit pkgs user homeDirectory; })
    ];
    home-manager.extraSpecialArgs = {
      inherit extraPackages homeDirectory user;
    };
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.zell = import ./home.nix;
  }
]
