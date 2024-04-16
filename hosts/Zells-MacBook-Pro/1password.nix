{ homeDirectory, lib, pkgs, config, ... }: {
    home.sessionVariables = {
      SSH_AUTH_SOCK = "${homeDirectory}/.1password/agent.sock";
    };

    file.".1password/agent.sock" = lib.mkIf pkgs.stdenv.isDarwin {
      source = config.lib.file.mkOutOfStoreSymlink
        "${homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };

    programs.ssh = {
      enable = true;
      matchBlocks."*" = {
        extraOptions = { IdentityAgent = "~/.1password/agent.sock"; };
      };
    };
}
