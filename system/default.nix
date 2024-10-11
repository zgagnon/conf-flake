{ lib, pkgs, user, ... }: {
system.stateVersion = 5;
  nixpkgs = { config.allowUnfree = true; };
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      trusted-users =["@admin"];
      auto-optimise-store = false;
      substituters = [ "https://cache.iog.io" ];
      trusted-public-keys = [  "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
      extra-trusted-users = [ "@admin" user ];
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;
  environment.systemPackages = [ pkgs.vim ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    fira-code-nerdfont
  ];

  home-manager.users.${user}.services.syncthing = { enable = true; };
  launchd.daemons.linux-builder = {
    serviceConfig = {
      StandardOutPath = "/var/log/darwin-builder.log";
      StandardErrorPath = "/var/log/darwin-builder.log";
    };
  };
}
