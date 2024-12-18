switch: darwin-rebuild commit
    figlet "State Updates"

branch:
    #!/usr/bin/env sh
    current_branch=$(git branch --show-current)

    # Get today's date in YYYY-MM-DD format
    today=$(date +%Y-%m-%d)

    # Check if the current branch is 'main'
    if [ "$current_branch" == "main" ]; then
            figlet "Branch"
            # Get the current branch name
            current_branch=$(git branch --show-current)

            # Get today's date in YYYY-MM-DD format
            today=$(date +%Y-%m-%d)

            # Create a new branch with the name 'noodling-YYYY-MM-DD'
            new_branch="noodling-$today"
            git checkout -b "$new_branch"
            echo "Created and switched to new branch: $new_branch"
    else
            echo "Not on the 'main' branch. Current branch is: $current_branch"
    fi

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

tangle: branch
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

install-homebrew:
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

commit: tangle delete-ssh-config branch
    #!/usr/bin/env sh
    SCRIPT_PATH="${BASH_SOURCE:-$0}"
    SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
    (
        if [[ $(git status --porcelain) ]]; then
            figlet "Commit"
        git add .
        git add .
        commit_message=$(date)
        git commit -m "$commit_message"
        else
          echo "Working directory clean"
        fi
    )

doom-sync:
    figlet "DOOM"
    doom sync

doom: doom-sync commit

finish:
    git add .
    git add .
    git ci
    git rebase -i main
    git merge main
