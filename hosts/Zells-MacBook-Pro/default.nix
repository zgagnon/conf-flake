{ pkgs, lib,  ... }:
let
  homebrew = import ./homebrew.nix;
  homeDirectory = "/Users/zell";
  gitmessage = ./.gitmessage;
  email = "zell@mechanical-orchard.com";
  packages = import ./home-manager.nix { inherit pkgs; };
in {
  imports = [
    ../../system
    ../../os/mac
    ../../programs/direnv
    ../../programs/zsh
    ../../programs/vim
    (import ../../programs/paperwm.spoon { inherit homeDirectory lib pkgs; })
    (import ../../programs/homebrew { inherit homebrew; })
    (import ../../programs/git {
      inherit lib gitmessage pkgs homeDirectory email;
    })
    (import ../../programs/git/column-log { inherit homeDirectory; })
  ];


  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.zell = { pkgs, config, emacs-ng, ... }: {
      imports = [ ../../programs/1password ];
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
