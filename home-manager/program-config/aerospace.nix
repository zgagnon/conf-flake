{
  enable = true;
  settings = {
    after-login-command = [ ];
    after-startup-command = [ ];
    start-at-login = true;
    enable-normalization-flatten-containers = true;
    enable-normalization-opposite-orientation-for-nested-containers = true;

    accordion-padding = 30;
    default-root-container-layout = "tiles";
    default-root-container-orientation = "auto";
    on-focused-monitor-changed = [
      "move-mouse monitor-lazy-center"
    ];
    automatically-unhide-macos-hidden-apps = false;
    key-mapping = {
      preset = "qwerty";
    };

    gaps = {
      inner.horizontal = 0;
      inner.vertical = 0;
      outer.left = 0;
      outer.bottom = 0;
      outer.top = 0;
      outer.right = 0;
    };

    mode.main.binding = {
      cmd-ctrl-alt-period = "layout tiles horizontal vertical";
      cmd-ctrl-alt-comma = "layout accordion horizontal vertical";
      cmd-ctrl-alt-left = "focus left";
      cmd-ctrl-alt-down = "focus down";
      cmd-ctrl-alt-up = "focus up";
      cmd-ctrl-alt-right = "focus right";

      cmd-ctrl-alt-shift-left = "move left";
      cmd-ctrl-alt-shift-down = "move down";
      cmd-ctrl-alt-shift-up = "move up";
      cmd-ctrl-alt-shift-right = "move right";

      cmd-ctrl-alt-shift-r = "resize smart -100";
      cmd-ctrl-alt-r = "resize smart +100";

      cmd-ctrl-alt-i = "mode service";
    };

    mode.service.binding = {
      esc = [
        "reload-config"
        "mode main"
      ];
      r = [
        "flatten-workspace-tree"
        "mode main"
      ];
      f = [
        "layout floating tiling"
        "mode main"
      ];
      backspace = [
        "close-all-windows-but-current"
        "mode main"
      ];

      alt-shift-h = [
        "join-with left"
        "mode main"
      ];
      alt-shift-j = [
        "join-with down"
        "mode main"
      ];
      alt-shift-k = [
        "join-with up"
        "mode main"
      ];
      alt-shift-l = [
        "join-with right"
        "mode main"
      ];
    };
  };
}