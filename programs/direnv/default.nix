{...}:
{
  home-manager.users.zell.programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };
}
