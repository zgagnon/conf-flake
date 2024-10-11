{ pkgs, lib,  ... }:
let
  homebrew = import ./homebrew.nix;
  homeDirectory = "/Users/zell";
  gitmessage = ./.gitmessage;
  email = "zell@mechanical-orchard.com";
  packages = import ./home-manager.nix { inherit pkgs; };


  submoduleConfig = {
    inherit lib pkgs gitmessage homeDirectory email homebrew;
    user = "zell";
    };

  submodules = [
    ../../system
    ../../os/mac
    ../../programs/direnv
    ../../programs/zsh
    ../../programs/homebrew
    ../../programs/git
    ../../programs/git/column-log
    ../../programs/paperwm.spoon
    ../../programs/1password
  ];
  applySubmodule = x: (import x submoduleConfig);
in {
  imports = builtins.map applySubmodule submodules;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.zell = { pkgs, config,  ... }: {
      home = {
        stateVersion = "23.11";
        username = lib.mkDefault "zell";
        homeDirectory = lib.mkForce homeDirectory;

         sessionVariables = { EDITOR = "vim"; };

        packages = packages;
      };
      programs.home-manager.enable = true;
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
