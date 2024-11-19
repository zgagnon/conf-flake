{
  pkgs,
  specialArgs,
  config,
  ...
}:
let
  lib = pkgs.lib;
  kitty = import ../../new-progs/kitty.nix { inherit pkgs; } { };
  nushell = import ../../new-progs/nushell.nix { inherit pkgs; };
  zsh = import ../../new-progs/zsh.nix;
  direnv = import ../../new-progs/direnv.nix;
  wezterm = import ../../new-progs/wezterm.nix {
package = specialArgs.extraPackages.wezterm;
  };
  programs = kitty // nushell // zsh // direnv // wezterm;

in
{
  inherit programs;
  home = {
    stateVersion = "23.11";
    username = lib.mkDefault "zell";
    homeDirectory = lib.mkForce "/Users/zell";
    packages = import ./home-manager.nix { inherit pkgs; };
  };
}
