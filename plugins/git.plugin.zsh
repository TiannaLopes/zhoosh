# Git Plugin for Zhoosh

# Git Cloning
alias gcl='git clone'                  # Clone a repository

# Git Checkout
alias gco='git checkout'               # Checkout a branch
alias gcb='git checkout -b'            # Create a new branch and switch to it

# Git Status
alias gs='git status'                  # Show the working tree status

# Git Add
alias ga='git add'                     # Add files to staging
alias gaa='git add --all'              # Add all files (new, modified, deleted)

# Git Commit
alias gc='git commit'                  # Commit with a message
alias gca='git commit --amend'         # Amend the last commit
alias gcm='git commit -m'              # Commit with a message

# Git Push
alias gp='git push'                    # Push to remote
alias gpf='git push --force'           # Force push
alias gpu='git push -u origin HEAD'    # Push the current branch and set upstream

# Git Pull
alias gpl='git pull'                   # Pull latest changes from remote
alias gplr='git pull --rebase'         # Pull with rebase to avoid extra merge commits

# Git Fetch
alias gf='git fetch'                   # Fetch latest changes from remote

# Git Merge
alias gm='git merge'                   # Merge a branch into the current branch

# Git Rebase
alias grb='git rebase'                 # Rebase current branch onto another branch
alias grbc='git rebase --continue'     # Continue rebasing after resolving conflicts
alias grba='git rebase --abort'        # Abort a rebase

# Git Log
alias gl='git log'                     # Show commit logs
alias gls='git log --stat'             # Show commit logs with file stats
alias glp='git log --oneline --graph --decorate --all'  # Pretty log with graph

# Git Diff
alias gd='git diff'                    # Show differences between working directory and index
alias gdc='git diff --cached'          # Show differences between index and last commit
alias gds='git diff --staged'          # Same as gdc, alias for convenience

# Git Branch
alias gb='git branch'                  # List branches
alias gba='git branch -a'              # List all branches (local and remote)
alias gbd='git branch -d'              # Delete a local branch
alias gbD='git branch -D'              # Force delete a local branch

# Git Remote
alias gr='git remote'                  # Manage remotes
alias gra='git remote add'             # Add a new remote
alias grv='git remote -v'              # Show remotes and their URLs
alias grd='git remote remove'          # Remove a remote

# Git Stash
alias gst='git stash'                  # Stash changes
alias gstp='git stash pop'             # Apply the most recent stash and remove it
alias gstl='git stash list'            # List all stashes

# Git Reset
alias grs='git reset'                  # Reset the index (keep changes in working directory)
alias grsh='git reset --hard'          # Hard reset (discard all changes)

# Git Clean
alias gclean='git clean -fd'           # Remove untracked files and directories

# Git Tag
alias gtag='git tag'                   # List tags
alias gtat='git tag -a'                # Create an annotated tag
alias gtd='git tag -d'                 # Delete a tag

# Git Cherry-pick
alias gcp='git cherry-pick'            # Cherry-pick a commit by hash
alias gcpc='git cherry-pick --continue'  # Continue after resolving conflicts
alias gcpa='git cherry-pick --abort'   # Abort cherry-pick

# Git Bisect
alias gbis='git bisect'                # Start a bisect session
alias gbisg='git bisect good'          # Mark current commit as good
alias gbisb='git bisect bad'           # Mark current commit as bad
alias gbisr='git bisect reset'         # Reset bisect session

# Git Blame
alias gblame='git blame'               # Show what revision and author last modified each line of a file

# Git Ignore
alias gign='git update-index --assume-unchanged'  # Temporarily ignore file changes
alias gignr='git update-index --no-assume-unchanged'  # Revert temporary ignore

# Git Show
alias gshow='git show'                 # Show details about a specific commit

# Git Grep
alias ggrep='git grep'                 # Search for text patterns in the repository
