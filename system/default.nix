{ config, lib, pkgs, ... }: {
  nixpkgs = { config.allowUnfree = true; };
  nix = {
    settings = {
      auto-optimise-store = false;
      trusted-substituters = [ ];
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
