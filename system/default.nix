user:
{ pkgs, ... }: let
  lib = pkgs.lib;
  in
{
  system.stateVersion = 5;
  nixpkgs = {
    config.allowUnfree = true;
  };
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      trusted-users = [ "@admin" ];
      auto-optimise-store = false;
      substituters = [ "https://cache.iog.io" ];
      trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
      extra-trusted-users = [
        "@admin"
        user
      ];
    };

    extraOptions =
      ''
        experimental-features = nix-command flakes
      ''
      + lib.optionalString (pkgs.system == "aarch64-darwin") ''
        extra-platforms = x86_64-darwin aarch64-darwin
      '';
  };


  programs.zsh.enable = true;
  environment.systemPackages = [ pkgs.vim ];

  launchd.daemons.linux-builder = {
    serviceConfig = {
      StandardOutPath = "/var/log/darwin-builder.log";
      StandardErrorPath = "/var/log/darwin-builder.log";
    };
  };
}
