{
  pkgs,
  specialArgs,
  config,
  ...
}:
let
  lib = pkgs.lib;
in
{
  # inherit programs;
  programs.aerospace = import ./program-config/aerospace.nix;
  # programs.wezterm = import ./program-config/wezterm.nix {
  #   package = specialArgs.extraPackages.wezterm;
  # };
  programs.nushell = import ./program-config/nushell.nix;
  programs.starship = import ./program-config/starship.nix { inherit lib; };
  programs.carapace = import ./program-config/carapace.nix;
  programs.atuin = import ./program-config/atuin.nix;
  programs.zoxide = import ./program-config/zoxide.nix;
  programs.direnv = import ./program-config/direnv.nix;
  programs.zsh = import ./program-config/zsh.nix {inherit config;};
  programs.gpg = import ./program-config/gpg.nix;

  services.syncthing.enable = true;
  home = {
    stateVersion = "23.11";
    username = lib.mkDefault specialArgs.user;
    homeDirectory = lib.mkForce specialArgs.homeDirectory;
    file = {
      ".config/ghostty/config" = {
        source = files/ghostty;
      };
    };
    packages = (
      import ./home-manager.nix {
        inherit pkgs ;
        extraPackages = specialArgs.extraPackages;
      }
    );
  };
}
