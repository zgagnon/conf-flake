{ homeDirectory, user, ... }: {
  home-manager.users.${user} = {
    home.file = {
      "${homeDirectory}/.githelpers".source = ./.githelpers;
    };
    programs.git.aliases = {
      l = "!. ~/.githelpers && pretty_git_log";
    };
  };
}
