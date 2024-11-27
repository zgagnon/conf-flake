{
  lib,
  pkgs,
  homeDirectory,
  email,
  user,
  ...
}:
let
  aliases = import ./aliases.nix;
in
{
  home-manager.users.${user} = {
    programs.git = {
      aliases = aliases;
      enable = true;
      extraConfig = {
        gpg = {
          format = "ssh";
        };
        "gpg \"ssh\"" = lib.mkIf pkgs.stdenv.isDarwin {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
        core = {
          hooksPath = "bin/githooks";
          fsmonitor = "true";
          filemode = "true";
          editor = "vi";
        };
        mergetool."idea" = {
          cmd = ''
            idea merge \
                            \"$(cd \"$(dirname \"$LOCAL\")\" && pwd)/$(basename \"$LOCAL\")\" \
                            \"$(cd \"$(dirname \"$REMOTE\")\" && pwd)/$(basename \"$REMOTE\")\" \
                            \"$(cd \"$(dirname \"$BASE\")\" && pwd)/$(basename \"$BASE\")\" \
                            \"$(cd \"$(dirname \"$MERGED\")\" && pwd)/$(basename \"$MERGED\")\" \
          '';
        };
        push.autoSetupRemote = false;
        rerere = {
          enabled = true;
        };
        column.branch = "auto";
        maintenance.strategy = "incremental";
      };
      userName = "zgagnon";
      userEmail = email;
    };
  };
}
