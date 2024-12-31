switch: darwin-rebuild tangle delete-ssh-config
    figlet "State Updates"

delete-ssh-config:
    #!/usr/bin/env sh
    config_file="$HOME/.ssh/config"

    if [ -f "$config_file" ]; then
      figlet "SSH"
      echo "Deleting existing SSH config file: $config_file"
      rm "$config_file"
    else
      echo "No existing SSH config file found."
    fi

tangle:
    #!/usr/bin/env sh
    SCRIPT_PATH="${BASH_SOURCE:-$0}"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

    (
        tangle_org() {
          local file="$1"
          printf "\033[1;34m%s\033[0m\n" "$file"
          emacs --batch --load org --eval "(org-babel-tangle-file \"$file\")"
        }
        git_changes=$(git status | grep '\.org$')

        echo "$git_changes"

        if [ -n "${git_changes[*]}" ]; then
            figlet "Tangle"
            for file in $(git diff --name-only --diff-filter=M | grep '\.org$'); do
                tangle_org "$file"
    
                git add .
            done
        else
          echo "No files to tangle"
        fi

    )

tangle-all:
    #!/usr/bin/env sh

    SCRIPT_PATH="${BASH_SOURCE:-$0}"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

    (
        tangle_org() {
          local file="$1"
          printf "\033[1;34m%s\033[0m\n" "$file"
          emacs --batch --load org --eval "(org-babel-tangle-file \"$file\")"
        }
        files=$(fd org)


        if [ -n "${files[*]}" ]; then
            figlet "Tangle All"
            for file in $files; do
                tangle_org "$file"

                git add .
            done
        else
          echo "No files to tangle"
          exit 1
        fi

    )

darwin-rebuild: tangle delete-ssh-config
    figlet "Rebuild"
    darwin-rebuild switch --flake . --fallback --show-trace
