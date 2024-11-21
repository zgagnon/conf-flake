{
  enable = true;
  extraConfig = ''
    $env.PATH = ($env.PATH | split row (char esep) | append '$nu.home-path/.config/emacs/bin')
  '';
}
