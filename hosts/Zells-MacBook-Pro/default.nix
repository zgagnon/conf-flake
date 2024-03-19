# Default.nix
# :PROPERTIES:
# :header-args: :tangle default.nix :comments org
# :END:


{ pkgs, lib, ... }:

{



# Allow unfree packages

  nixpkgs = { config.allowUnfree = true; };



# Configuring nix on the machine. Apple Silicon Rosetta is very good, so we can run x86_64 stuff too.
# Also add the nix daemon so that nix isn't super slow

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-substituters = [ ];
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  services.nix-daemon.enable = true;



# Set up MacOs. Enable touch id for sudo on the console

  security.pam.enableSudoTouchIdAuth = true;
  system.defaults = { dock.autohide = true; };



# Enable zsh and neovim globally. Need to have these available in all accounts

  programs.zsh.enable = true;
  environment.systemPackages = [ pkgs.neovim ];



# Configure Homebrew as a module of the flake

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    brews = [ ];

    taps = [ "homebrew/cask-fonts" ];

    casks = [
      "skype"
      "cursor"
      "orbstack"
      "hammerspoon"
      "zoom"
      "font-fira-mono-nerd-font"
      "logseq"
      "raycast"
      "slack"
      "tuple"
      "tandem"
      "warp"
      "arc"
      "readdle-spark"
      "docker"
      "spotify"
      "google-chrome"
      "soundsource"
    ];
  };



# Configure Home Manager as a module of the flake

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.zell = { pkgs, config, ... }: {
      home = {
        stateVersion = "23.11";
        username = lib.mkDefault "zell";
        homeDirectory = lib.mkForce "/Users/zell";



# Generic packages. These are packages that are not controlled by Home Manager

        packages = with pkgs; [
               _1password
               action-validator
          cabal-install
          dbeaver
          discord
          elixir
          elixir_ls
          emacs
          erlfmt
          fasd
          fd
          fira-code
          google-cloud-sdk
          gnugrep
          haskellPackages.hoogle
          haskellPackages.lsp
          jetbrains.idea-community
          kubectx
          kubernetes-helm
          mob
          neovim
          nixfmt
          nodejs
          pandoc
          ripgrep
          shellcheck
          shfmt
          terraform
          vscodium
     gh
        ];



# Insert these in to every session. The SSH auth sock is to allow 1password to handle ssh for GitHub specifically, but also everything else

        sessionVariables = {
          EDITOR = "vim";
          SSH_AUTH_SOCK = "${config.home.homeDirectory}/.1password/agent.sock";

        };

        file.".1password/agent.sock" = lib.mkIf pkgs.stdenv.isDarwin {
          source = config.lib.file.mkOutOfStoreSymlink
            "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
        };
      };



# SSH configuration, let Home Manager handle this, and set the 1password identity agent

      programs.ssh = {
        enable = true;
        matchBlocks."*" = {
          extraOptions = { IdentityAgent = "~/.1password/agent.sock"; };
        };
      };



# Home Manager manages itself

      programs.home-manager.enable = true;



# Direnv creates per-directory. Configure it for nix, and plug it directly in to ZSH

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };



# Basic VIM configuration
# TODO: Does this currently work for NVIM?

      programs.vim = {
        enable = true;
        settings = {
          number = true;
          tabstop = 2;
          expandtab = true;
          shiftwidth = 2;
        };
      };



# ZSH. The extra config is:

# v: use fasd fuzzy search to open files with vim
# ls: over-ridden to always do long format since short format is kinda useless
# ms: mob.sh start
# vim: over-ridden to always be nvim for muscle memory
# em: launch the emacs client, this short be the default way to launch itself

# Toss doom into the PATH so we can update the emacs config from anywhere

      programs.zsh = {
        enable = true;
        enableAutosuggestions = true;
        initExtra = builtins.concatStringsSep "\n" [
          "export EDITOR=vim"
          "if [ -e $HOME/.profile ]; then . $HOME/.profile; fi"
          "export NIXPKGS_ALLOW_UNFREE=1"
          "export DOOMDIR=\"$HOME/darwin-flake/doom\""
          ''eval "$(fasd --init auto)"''
          "alias g=git"
          "alias v='f -e vim'"
          "alias ls='ls -lahG'"
          "alias history='fc -l 1'"
          "alias ms='mob start'"
          "alias vim=nvim"
          "alias em=\"emacsclient -t -a ''\""
          ''eval "$(/opt/homebrew/bin/brew shellenv)"''
          ''export PATH="$PATH:$HOME/.config/emacs/bin:$HOME/darwin-flake"''
        ];

        history = {
          ignoreSpace = true;
          ignoreDups = true;
          save = 100000;
          size = 100000;
        };
      };



# The git config is pretty big since this is a core tool

      programs.git = {
        enable = true;



# With pairing, we want every commit to be co-authored by the people in the ensemble. Using
# a message template with their names would make that easy

        extraConfig = { commit = { template = "~/.gitmessage"; }; };



# The signing key comes from 1password

        signing = {
          key =
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIImIyFtYh4ufxEZozn/sOLLynKbUSX7EOokdyAlyxLdD";
          signByDefault = true;
        };



# Aliases largely stolen from pivotal. I use this short code of git aliases rather than a chunk of shell aliases so that I can get completion and expansion

        aliases = {
          co = "checkout";
          st = "status";
          ci = "commit";


# Graph log

          lg =
            "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
          lgp =
            "log --pretty=format:'%C(yellow)%h%Creset - %s %C(auto)%d - %C(green)%ad - %C(blue)%an <%C(green)%ae%C(blue)>' --graph --date=local";
          lgf =
            "log --pretty=format:'%C(yellow)%h %C(green)%ad %C(red)%an%Creset %s %C(auto)%d' --graph --date=local --stat";


# Branch related aliases

          pr = "pull --rebase --autostash";
          rum = "rebase main@{u}";
          bl = "branch --list";
          ba = "branch --all";
          pf = "push --force-with-lease";


# Commit manipulations

          pop = "reset HEAD^";
          update = "ci --amend --no-edit";
          cp = "cherry-pick";
          dfc = "diff --cached";
          rpo = "remote prune origin";


# Stashing

          sl = "stash list";
          sll = "stash-list";
          slll = "stash-list --full";
          ss = "stash save";
          sa = "!sh -c 'git stash apply stash@{$1}' -";
          sd = "!sh -c 'git stash drop stash@{$1}' -";


# This part is a poor implementation of a patch queue. Probably need to revisit it

          wb-set = "!git co working-branch && git reset --hard main";
          wb-update =
            "! git co main && git pr && git co working-branch && git rum";
          wb-remain =
            "! git co working-branch && git rum && git co main && git reset --hard working-branch && git reset HEAD^";
          wb-wip =
            "! git add . && git ci -am 'WIP' && git co working-branch && git co main && git reset --hard origin/main";
        };
        extraConfig = {
          gpg = { format = "ssh"; };
          "gpg \"ssh\"" = lib.mkIf pkgs.stdenv.isDarwin {
            program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          };
          core = {
            hooksPath = "bin/githooks";
            fsmonitor = "true";
            filemode = "true";
          };
          rerere = { enabled = true; };
          column.branch ="auto";
          maintenance.strategy = "incremental";
        };
        userName = "zgagnon";
        userEmail = "zell@mechanical-orchard.com";
      };



# Manage syncthing

      services.syncthing = { enable = true; };
    };
  };

}
