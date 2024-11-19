{ pkgs, ... }:
let
  lib = pkgs.lib;
in
{
  nushell = {
    enable = true;
    extraConfig = ''
    $env.PATH = ($env.PATH | split row (char esep) | append '$nu.home-path/.config/emacs/bin')
    '';
  };
  starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$shell"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$fill"
        "$dotnet"
        "$elixir"
        "$haskell"
        "$nix_shell"
        "$direnv"
        "$line_break"
        "$status"
        "$sudo"
        "$character"
      ];

      shell = {
        disabled = false;
        style = "red bold";
      };

      right_format = lib.concatStrings [
        "$cmd_duration"
      ];

      direnv = {
        disabled = false;
        symbol = "drenv";
        allowed_msg = "✅";
        not_allowed_msg = "🚫";
        loaded_msg = "💯";
        unloaded_msg = "🈳";
      };

      git_metrics = {
        added_style = "bold blue";
        format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
      };

      cmd_duration = {
        min_time = 0;
        show_milliseconds = true;
        show_notifications = true;
      };

      character = {
        success_symbol = "➜";
        error_symbol = "➜|";
      };
    };
  };
  carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
  atuin = {
    enable = true;
    enableNushellIntegration = true;
  };
  zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
  direnv = {
    enableNushellIntegration = true;
  };
}
