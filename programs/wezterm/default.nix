{
  user,
  pkgs,
  specialArgs,
  ...
}:
let
  wezterm = specialArgs.wezterm;
in
{
  home-manager.users.${user}.programs = {
    wezterm = {
      enable = true;
      package = wezterm;
    };
  };
}
