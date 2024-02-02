{pkgs, lib, ...}:

{  
  nixpkgs = {
        config.allowUnfree = true;
  };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  environment.systemPackages = [
    pkgs.neovim
  ];
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
    ];

    casks = [
      "cursor"
      "hammerspoon"
      "logseq"
      "raycast"
      "slack"
      "tuple"
      "tandem"
      "warp"
      "arc"
      "readdle-spark"
      "docker"
    ];
  };

   system.defaults = {
      dock.autohide = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.zell = {pkgs, config, ...}: {
      home = {
        stateVersion = "23.11";
        username = lib.mkDefault "zell";
        homeDirectory = lib.mkForce "/Users/zell";

        packages = with pkgs; [
          vscodium
          fasd
          discord
          neovim
          _1password
          kubectx
          mob
          jetbrains.idea-community
        ];

        sessionVariables = {
          EDITOR = "nvim";
          SSH_AUTH_SOCK = "${config.home.homeDirectory}/.1password/agent.sock";

        };

        file.".1password/agent.sock" = lib.mkIf pkgs.stdenv.isDarwin {
          source = config.lib.file.mkOutOfStoreSymlink
          "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
        };
      };

      programs.ssh = {
        enable = true;
        matchBlocks."*" = {
          extraOptions = {
            IdentityAgent = "~/.1password/agent.sock";
          };
        };
      };

      programs.home-manager.enable = true;

      programs.direnv.enable = true;
      programs.direnv.nix-direnv.enable = true;

      programs.vim = {
        enable = true;
        settings = {
          number = true;
          tabstop = 2;
          expandtab = true;
          shiftwidth = 2;
        };
      };

      programs.zsh = {
        enable = true;
        enableAutosuggestions = true;
        initExtra = builtins.concatStringsSep "\n" [
          "export EDITOR=vim"
          "if [ -e $HOME/.profile ]; then . $HOME/.profile; fi"
          "export NIXPKGS_ALLOW_UNFREE=1"
          "eval \"$(fasd --init auto)\""
          "alias g=git"
          "alias v='f -e vim'"
          "alias ls='ls -lahG'"
          "alias history='fc -l 1'"
          "eval \"$(/opt/homebrew/bin/brew shellenv)\""
        ];

        history = {
          ignoreSpace = true;
          ignoreDups = true;
          save = 100000;
          size = 100000;
        };
      };

      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        # Configuration written to ~/.config/starship.toml
        settings = {
          # add_newline = false;

          # character = {
          #   success_symbol = "[➜](bold green)";
          #   error_symbol = "[➜](bold red)";
          # };

          # package.disabled = true;
        };
      };

      programs.git = {
        enable = true;
        signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIImIyFtYh4ufxEZozn/sOLLynKbUSX7EOokdyAlyxLdD";
        signByDefault = true;
        };


        aliases = {
          co = "checkout";
          st = "status";
          ci = "commit";
          lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
          lgp = "log --pretty=format:'%C(yellow)%h%Creset - %s %C(auto)%d - %C(green)%ad - %C(blue)%an <%C(green)%ae%C(blue)>' --graph --date=local";
          lgf = "log --pretty=format:'%C(yellow)%h %C(green)%ad %C(red)%an%Creset %s %C(auto)%d' --graph --date=local --stat";
          pr = "pull --rebase --autostash";
          rum = "rebase main@{u}";
          cp = "cherry-pick";
          dfc = "diff --cached";
          rpo = "remote prune origin";
          bl = "branch --list";
          ba = "branch --all";
          sl = "stash list";
          sll = "stash-list";
          slll = "stash-list --full";
          ss = "stash save";
          sa = "!sh -c 'git stash apply stash@{$1}' -";
          sd = "!sh -c 'git stash drop stash@{$1}' -";
          pop = "reset HEAD^";
          update = "ci --amend --no-edit";
          wb-set = "!git co working-branch && git reset --hard main";
          wb-update = "! git co main && git pr && git co working-branch && git rum";
          wb-remain = "! git co working-branch && git rum && git co main && git reset --hard working-branch && git reset HEAD^";
          wb-wip = "! git add . && git ci -am 'WIP' && git co working-branch && git co main && git reset --hard origin/main";
        };
        extraConfig = {
            gpg = { format = "ssh"; };
          "gpg \"ssh\"" = lib.mkIf pkgs.stdenv.isDarwin {
            program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          };
          core = {
            hooksPath = "bin/githooks";
          };
          difftool = {
            prompt = false;
            tool = "webstorm";
          };
          merge = {
            tool = "webstorm";
          };
          "difftool \"webstorm\"" = {
            cmd = "~/.bin/mergestorm diff $(cd $(dirname \"$LOCAL\") && pwd)/$(basename \"$LOCAL\") $(cd $(dirname \"$REMOTE\") && pwd)/$(basename \"$REMOTE\")";
            trustExitCode = true;
          };
          "mergetool \"webstorm\"" = {
            keepTemporaries = true;
            cmd = "~/.bin/mergestorm   merge  $(cd $(dirname \"$LOCAL\") && pwd)/$(basename \"$LOCAL\") $(cd $(dirname \"$REMOTE\") && pwd)/$(basename \"$REMOTE\") $(cd $(dirname \"$BASE\") && pwd)/$(basename \"$BASE\") $(cd $(dirname \"$MERGED\") && pwd)/$(basename \"$MERGED\")";
            trustExitCode = true;
          };
          rerere = {
            enabled = true;
          };
        };
        userName = "zgagnon";
        userEmail = "zell@mechanical-orchard.com";
      };

      services.syncthing = {
        enable = true;
      };
    };
  };

  nix.settings = {
    auto-optimise-store = true;
  };
}