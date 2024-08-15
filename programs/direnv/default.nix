{user, ...}:
{
  home-manager.users.${user}.programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };
}
