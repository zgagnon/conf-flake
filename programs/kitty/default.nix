{ user, pkgs, ... }: {
  home-manager.users.${user}.programs = {
    kitty = {
      enable = true;
      settings = {
        background_opacity = 0.75;
        background_blur = 16;
        hide_window_decorations = "titlebar-only";
        macos_quit_when_last_window_closed = "yes";
      };
      font = {
        size = 18;
        package = pkgs.fira-code-nerdfont;
        name = "FiraCode";
      };
    };
  };
}
