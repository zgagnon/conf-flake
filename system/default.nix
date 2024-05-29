{ config, lib, pkgs, ... }: {
  nixpkgs = { config.allowUnfree = true; };
  nix = {
    settings = {
      auto-optimise-store = false;
      trusted-substituters = [ ];
      extra-trusted-users = ["@admin" "zell"];
    };
    linux-builder = {
    enable = true;
    ephemeral = true;
    maxJobs = 4;
    config = {
      virtualisation = {
        darwin-builder = {
          diskSize = 40 * 1024;
          memorySize = 8 * 1024;
        };
        cores = 6;
      };
    };
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;
  environment.systemPackages = [ pkgs.neovim ];

  home-manager.users.zell.services.syncthing = { enable = true; };
}
