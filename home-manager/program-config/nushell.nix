{
  enable = true;
  extraConfig = ''
    $env.PATH = ($env.PATH | split row (char esep) | append '$nu.home-path/.config/emacs/bin')
    
    def fuck [] {
        $env.THEFUCK_REQUIRE_CONFIRMATION = false
        $env.THEFUCK_HISTORY_LIMIT = 9999
        $env.THEFUCK_WAIT_COMMAND = 10
        let output = (^thefuck ...(history | last 1 | get command | str trim) | str trim)
        print $output
        nu -c $output
    }
    
    jj util completion nushell | save -f completions-jj.nu
    
    
    if (ls ~/.ai.env.toml | is-not-empty ) {
    print "Loading AI env vars...";
    open ~/.ai.env.toml | load-env; }
  '';
}
