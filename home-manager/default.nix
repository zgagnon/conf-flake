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
  homebrew = import ../os/mac/homebrew.nix homebrewPackages;
  lib = pkgs.lib;
in
[
  system
  mac
  homebrew
  home-manager.darwinModules.home-manager
  {
    imports = [
      (import ./program-config/onep.nix {
        inherit homeDirectory lib pkgs user;
      })
      (import ./program-config/git.nix {
        inherit lib pkgs homeDirectory user email;
      })
      (import ./program-config/jj.nix {
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
