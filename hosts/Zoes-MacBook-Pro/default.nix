{ pkgs, lib, config, ... }:
let
  homebrew = import ./homebrew.nix;
  homeDirectory = "/Users/zoe";
  gitmessage = ./.gitmessage;
  email = "zoe@zgagnon.com";
  packages = import ./home-manager.nix { inherit pkgs; };

  submoduleConfig = {
    inherit lib pkgs gitmessage homeDirectory email homebrew;
    user = "zoe";
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

  homebrew = homebrew;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.zoe = { pkgs, config, emacs-ng, ... }: {
      home = {
        stateVersion = "24.05";
        username = lib.mkDefault "zoe";
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
