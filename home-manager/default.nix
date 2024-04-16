{ lib, pkgs, config, homeDirectory, packages,... }: {
  imports = [ ../../programs/1password ];
  home = {
    stateVersion = "23.11";
    username = lib.mkDefault "zell";
    homeDirectory = lib.mkForce homeDirectory;

    sessionVariables = {
      EDITOR = "vim";
      SSH_AUTH_SOCK = "${homeDirectory}/.1password/agent.sock";

    };

    packages = packages;

    file.".1password/agent.sock" = lib.mkIf pkgs.stdenv.isDarwin {
      source = config.lib.file.mkOutOfStoreSymlink
        "${homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
  };

  programs.ssh = {
    enable = true;
    matchBlocks."*" = {
      extraOptions = { IdentityAgent = "~/.1password/agent.sock"; };
    };
  };

  programs.home-manager.enable = true;
}
