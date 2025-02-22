
#
# ZSH Prompt
#

function is_git_repo() {
  git rev-parse --is-inside-work-tree &>/dev/null
}

function prompt_atom() {
  local last_exit_code=$1

  if [[ $last_exit_code == 0 ]]; then
    PROMPT_ATOM="%F{#00ff00}  $last_exit_code "
  else
    PROMPT_ATOM="%F{#ff0000}  $last_exit_code "
  fi
}

function prompt_dirname() {
  PROMPT_DIRNAME="%F{#909090}${PWD##*/} "
}

function prompt_branch() {
  if is_git_repo; then
    local branch="$(git branch --show-current)"

    if [[ -n $branch ]]; then
      PROMPT_BRANCH="%F{#009090} $branch "
    else
      PROMPT_BRANCH="%F{#ff0000} DETACHED "  # Handle detached HEAD
    fi
  else
    PROMPT_BRANCH=""
  fi
}

function prompt_status() {
  if ! is_git_repo; then
    PROMPT_STATUS=""
    return 0
  fi

  # Untracked files
  if [[ -n $(git ls-files --others --exclude-standard) ]]; then
    PROMPT_STATUS="💔 "

  # Unstaged changes
  elif ! git diff --quiet 2>/dev/null; then
    PROMPT_STATUS="🧡 "

  # Staged changes
  elif ! git diff --cached --quiet 2>/dev/null; then
    PROMPT_STATUS="💛 "  

  # Up to date
  else
    PROMPT_STATUS="💜 " 
  fi
}

function update_prompt() {
  local last_exit_code=$?

  prompt_atom $last_exit_code
  prompt_dirname
  prompt_branch
  prompt_status
  PROMPT="$PROMPT_ATOM$PROMPT_DIRNAME$PROMPT_BRANCH$PROMPT_STATUS%f"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd update_prompt



#
# SSH
#
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_atom-nixos
