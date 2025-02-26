{
  lib,
  pkgs,
  homeDirectory,
  email,
  user,
  ...
}:
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
          heads = ["log" "-r" "visible_heads()" "--no-pager"];

        };
        ui = {
          editor = "nix run nixpkgs#emacs30 -- -nw";
          default-command = ["log" "--no-pager"];
        };
      };
    };
  };
}
