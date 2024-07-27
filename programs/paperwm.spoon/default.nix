{ homeDirectory,pkgs, ... }: {
  home-manager.users.zoe.home.file = {
    "${homeDirectory}/.hammerspoon/Spoons/PaperWM.spoon".source =
      pkgs.fetchgit {
        url = "https://github.com/mogenson/PaperWM.spoon.git";
        rev = "44944a8d37c0a761ab3d005f22889d6a8fe2acc3";
        sha256 = "sha256-c5X0Y0jev1ccfrNuAGbXVoKvQSNeOME+n2Gm6qHuQJ8=";
      };
    "${homeDirectory}/.hammerspoon/init.lua".source =
      ./paperwm-init.lua;
  };
}
