{
  pkgs,
  specialArgs,
  config,
  ...
}:
let
  lib = pkgs.lib;
  nushell = import ../../new-progs/nushell.nix { inherit pkgs; };
  zsh = import ../../new-progs/zsh.nix;
  direnv = import ../../new-progs/direnv.nix;
  wezterm = import ../../new-progs/wezterm.nix {
    package = specialArgs.extraPackages.wezterm;
  };
  programs = nushell // zsh // direnv // wezterm;
in
{
  imports = [
    ../../home-manager/modules/aerospace.nix
  ];
  # inherit programs;
  programs.aerospace = import ../../home-manager/program-config/aerospace.nix;
  programs.wezterm = import ../../home-manager/program-config/wezterm.nix {
    package = specialArgs.extraPackages.wezterm;
  };
  programs.nushell = import ../../home-manager/program-config/nushell.nix;
  programs.starship = import ../../home-manager/program-config/starship.nix { inherit lib; };
  programs.carapace = import ../../home-manager/program-config/carapace.nix;
  programs.atuin = import ../../home-manager/program-config/atuin.nix;
  programs.zoxide = import ../../home-manager/program-config/zoxide.nix;
  programs.direnv = import ../../home-manager/program-config/direnv.nix;
  home = {
    stateVersion = "23.11";
    username = lib.mkDefault "zell";
    homeDirectory = lib.mkForce "/Users/zell";
    packages = import ./home-manager.nix { inherit pkgs; };
  };
}
