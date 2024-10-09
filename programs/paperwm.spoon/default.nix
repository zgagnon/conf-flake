{ homeDirectory,pkgs,user, ... }: {
  home-manager.users.${user}.home.file = {
    "${homeDirectory}/.hammerspoon/Spoons/PaperWM.spoon".source =
      pkgs.fetchgit {
        url = "https://github.com/mogenson/PaperWM.spoon.git";
        rev = "02a9ec65217167882b14c480cc1f7a0365f53f66";
        sha256 = "sha256-w6robrwSOEUcDyJbO98yQc44plCIfASR4L0s5TyqNjo=";
      };
    "${homeDirectory}/.hammerspoon/init.lua".source =
      ./paperwm-init.lua;
  };
}
