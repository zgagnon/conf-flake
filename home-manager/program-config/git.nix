{ lib, pkgs, homeDirectory, email, user, ... }: let
aliases = import ./aliases.nix;
in{
  home-manager.users.${user} = {
    programs.git = {
      aliases = aliases;
      enable = true;
      extraConfig = {
        gpg = { format = "ssh"; };
        "gpg \"ssh\"" = lib.mkIf pkgs.stdenv.isDarwin {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
        core = {
          hooksPath = "bin/githooks";
          fsmonitor = "true";
          filemode = "true";
          editor = "emacsclient -c -a ''";
        };
        push.autoSetupRemote = false;
        rerere = { enabled = true; };
        column.branch = "auto";
        maintenance.strategy = "incremental";
      };
      userName = "zgagnon";
      userEmail = email;
    };
  };
}
