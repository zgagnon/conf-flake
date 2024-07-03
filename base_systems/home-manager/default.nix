{ lib, pkgs, config, homeDirectory, packages,... }: {
  imports = [ ../../programs/1password ];
  home = {
    stateVersion = "23.11";
    username = lib.mkDefault "zell";
    homeDirectory = lib.mkForce homeDirectory;

    sessionVariables = {
      EDITOR = "vim";
    };

    packages = packages;
  };

  programs.home-manager.enable = true;
}
