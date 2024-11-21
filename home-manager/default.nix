{
  pkgs,
  extraPackages,
  home-manager,
  homeDirectory,
  user,
  email,
  ...
}@inputs:
let
  system = import ../system user inputs;
  mac = import ../os/mac;
  homebrewPackages = import ./homebrew.nix;
  homebrew = import ../new-progs/homebrew.nix homebrewPackages;
  lib = pkgs.lib;
in
[
  system
  mac
  homebrew
  home-manager.darwinModules.home-manager
  {
    imports = [
      (import ../new-progs/onep.nix {
        inherit homeDirectory lib pkgs user;
      })
      (import ../new-progs/git.nix {
        inherit lib pkgs homeDirectory user email;
      })
    ];
    home-manager.extraSpecialArgs = {
      inherit extraPackages homeDirectory user email;
    };
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.zell = import ./home.nix;
  }
]
