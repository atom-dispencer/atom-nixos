
#
# ZSH Prompt
#

function is_git_repo() {
  git rev-parse --is-inside-work-tree &>/dev/null
}

function prompt_atom() {
  local last_exit_code = $1

  if [[ $? == 0 ]]; then
    PROMPT_ATOM="%{$fg_bold[blue]%}"
  else
    PROMPT_ATOM="%{$fg_bold[magenta]%}"
  fi

  PROMPT_ATOM+="  $? "
  PROMPT_ATOM+="%{$reset_color}"
}

function prompt_dirname() {
  PROMPT_DIRNAME="%{$fg_bold[blue]%}"
  PROMPT_DIRNAME+="${PWD##*/}"
  PROMPT_DIRNAME+="%{$reset_color}"
}

function prompt_branch() {
  PROMPT_BRANCH="%{$fg_bold[blue]%}"

  if is_git_repo; then
    PROMPT_BRANCH+="$(git branch --show-current)"
  fi

  PROMPT_BRANCH+="%{$reset_color}"
}

function prompt_status() {
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
  PROMPT="$PROMPT_ATOM $PROMPT_DIRNAME $PROMPT_BRANCH $PROMPT_STATUS %{$reset_color%}"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd update_prompt



#
# SSH
#
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_atom-nixos
