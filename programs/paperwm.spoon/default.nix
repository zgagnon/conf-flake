{ homeDirectory,pkgs, ... }: {
  home-manager.users.zell.home.file = {
    "${homeDirectory}/.hammerspoon/Spoons/PaperWM.spoon".source =
      pkgs.fetchgit {
        url = "https://github.com/mogenson/PaperWM.spoon.git";
        rev = "6f7d1609cd5e642723540065d437a7059b4a7440";
        sha256 = "sha256-09qVq4aPRK/V8BEA5+OZRyg1aC0zuHrhcU6fUoA+1rg=";
      };
    "${homeDirectory}/.hammerspoon/init.lua".source =
      ./paperwm-init.lua;
  };
}
