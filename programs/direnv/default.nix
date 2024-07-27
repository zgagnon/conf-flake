{...}:
{
  home-manager.users.zoe.programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };
}
