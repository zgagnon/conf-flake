{
  package,
}:
{
  inherit package;
  enable = true;
  extraConfig = ''
    local config = wezterm.config_builder()
    config.font = wezterm.font("JetBrains Mono")
    config.font_size = 18
    config.color_scheme = "Tokyo Night Moon"
    config.hide_tab_bar_if_only_one_tab = true
    config.window_decorations = "RESIZE"
    return config
  '';
}
