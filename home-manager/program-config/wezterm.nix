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
    config.window_background_opacity = 0.90
    config.hide_tab_bar_if_only_one_tab = true
    
    return config
  '';
}
