{ config, lib, pkgs, ... }: {
  nixpkgs = { config.allowUnfree = true; };
  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users =["@admin"];
      auto-optimise-store = false;
      trusted-substituters = [ ];
      extra-trusted-users = [ "@admin" "zell" ];
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
  launchd.daemons.linux-builder = {
    serviceConfig = {
      StandardOutPath = "/var/log/darwin-builder.log";
      StandardErrorPath = "/var/log/darwin-builder.log";
    };
  };
}
