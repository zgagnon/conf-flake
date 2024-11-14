{package}:
{
  wezterm = {
    inherit package;
    enable = true;
    extraConfig = ''
    return {
      font = wezterm.font("JetBrains Mono"),
      font_size = 18.0,
      color_scheme = 'Ibm 3270 (High Contrast) (Gogh)',
      hide_tab_bar_if_only_one_tab = true,
      use_fancy_tab_bar = true;
      keys = {
        {key="n", mods="SHIFT|CTRL", action="ToggleFullScreen"},
      }
    }
    '';
  };
}
