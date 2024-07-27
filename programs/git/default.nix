{ lib, gitmessage, pkgs, homeDirectory, email, user, ... }: let
aliases = import ./aliases.nix;
    in{
  home-manager.users.zoe.home.file = {
    "${homeDirectory}/.gitmessage".source = gitmessage;
  };
  home-manager.users.zoe.programs.git = {
    aliases = aliases;
    enable = true;
    extraConfig = { commit = { template = "~/.gitmessage"; }; };
#    signing = {
#      key =
#        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIImIyFtYh4ufxEZozn/sOLLynKbUSX7EOokdyAlyxLdD";
#      signByDefault = true;
#    };
    extraConfig = {
      gpg = { format = "ssh"; };
      "gpg \"ssh\"" = lib.mkIf pkgs.stdenv.isDarwin {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      core = {
        hooksPath = "bin/githooks";
        fsmonitor = "true";
        filemode = "true";
      };
      push.autoSetupRemote = false;
      rerere = { enabled = true; };
      column.branch = "auto";
      maintenance.strategy = "incremental";
    };
    userName = "zgagnon";
    userEmail = email;
  };
}
