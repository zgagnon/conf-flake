{ homeDirectory, ... }: {
  home-manager.users.zell.home.file = {
    "${homeDirectory}/.githelpers".source = ./.githelpers;
  };

  home-manager.users.zell.programs.git.aliases = {
    l = "!. ~/.githelpers && pretty_git_log";
  };
}
