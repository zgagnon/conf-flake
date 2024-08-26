{user, ...}:
{
  home-manager.users.${user}.programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        initExtra = builtins.concatStringsSep "\n" [
          "export EDITOR=vim"
          "if [ -e $HOME/.profile ]; then . $HOME/.profile; fi"
          "export NIXPKGS_ALLOW_UNFREE=1"
          "export DOOMDIR=\"$HOME/conf-flake/doom\""
          ''eval "$(fasd --init auto)"''
          "alias g=git"
          "alias v='f -e vim'"
          "alias ls='ls -lahG'"
          "alias el='eza -labh --git --git-repos'"
          "alias history='fc -l 1'"
          "alias ms='mob start'"
          "alias vim=nvim"
          "alias em=\"emacsclient -t -a ''\""
          "alias clean-branches='git for-each-ref --format=\"%(refname:short)\" refs/heads | grep -v main | xargs -L1 git branch -D'"
          "alias clean-branches-remote='git for-each-ref --format=\"%(refname:short)\" refs/remotes | grep -v origin/main | xargs -L1 git branch -D --remote'"
          "alias emacs-restart=\"launchctl stop emacs_work && launchctl start emacs_work\""
          ''export PATH="$PATH:$HOME/.config/emacs/bin:$HOME/darwin-flake/switcher"''
          ''export AUTO_ENABLE_FLAKES=true''                ];

        history = {
          ignoreSpace = true;
          ignoreDups = true;
          save = 100000;
          size = 100000;
        };
      };

}
