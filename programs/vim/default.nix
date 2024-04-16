{ ... }: {
  home-manager.users.zell.programs.vim = {
    enable = true;
    settings = {
      number = true;
      tabstop = 2;
      expandtab = true;
      shiftwidth = 2;
    };
  };

}
