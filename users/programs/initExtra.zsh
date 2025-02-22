
#
# ZSH Prompt
#

function is_git_repo() {
  git rev-parse --is-inside-work-tree &>/dev/null
}

function prompt_atom() {
  local last_exit_code=$1

  if [[ $last_exit_code == 0 ]]; then
    PROMPT_ATOM="%F{rgb:0/255/0}  $last_exit_code "
  else
    PROMPT_ATOM="%F{rgb:0/0/255}  $last_exit_code "
  fi
}

function prompt_dirname() {
  PROMPT_DIRNAME="${PWD##*/} "
}

function prompt_branch() {
  if is_git_repo; then
    local branch="$(git branch --show-current)"

    if [[ -n $branch ]]; then
      PROMPT_BRANCH=" $branch "
    else
      PROMPT_BRANCH=" DETACHED "  # Handle detached HEAD
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

  if [[ -n $(git status --porcelain --untracked-files) ]]; then
    PROMPT_STATUS="💔"  # Untracked files
  elif ! git diff --quiet 2>/dev/null; then
    PROMPT_STATUS="🧡"  # Unstaged changes
  elif ! git diff --cached --quiet 2>/dev/null; then
    PROMPT_STATUS="💛"  # Staged changes
  else
    PROMPT_STATUS="💜"  # Clean state
  fi
}

function update_prompt() {
  local last_exit_code=$?

  prompt_atom $last_exit_code
  prompt_dirname
  prompt_branch
  prompt_status
  PROMPT="$PROMPT_ATOM$PROMPT_DIRNAME$PROMPT_BRANCH$PROMPT_STATUS"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd update_prompt



#
# SSH
#
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_atom-nixos
