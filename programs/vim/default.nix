{ user, ... }: {
  home-manager.users.${user}.programs.vim = {
    enable = true;
    settings = {
      number = true;
      tabstop = 2;
      expandtab = true;
      shiftwidth = 2;
    };
  };

}
