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
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          email = "zoe@zgagnon.com";
          name = "Zoe Gagnon";
        };
        aliases = {
          heads = ["log" "-r" "'heads(all())'"];
        };
      };

    };
  };
}
