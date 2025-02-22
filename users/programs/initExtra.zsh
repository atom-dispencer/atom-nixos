
#
# ZSH Prompt
#

function is_git_repo() {
  git rev-parse --is-inside-work-tree &>/dev/null
}

function prompt_atom() {
  PROMPT_ATOM=""
  if $?; then
    PROMPT_ATOM+="%{$fg_bold[blue]%}"
  else
    PROMPT_ATOM+="%{$fg_bold[magenta]%}"
  fi

  PROMPT_ATOM+="  $? "
  PROMPT_ATOM+="%{$reset_color}"
}

function prompt_dirname() {
  PROMPT_DIRNAME="%{$fg_bold[blue]%}"
  PROMPT_DIRNAME+="${PWD##*/}"
  PROMPT_DIRNAME+"%{$reset_color}"
}

function prompt_branch() {
  PROMPT_BRANCH="%{$fg_bold[blue]%}"

  if is_git_repo; then
    git branch --show-current
  fi

  PROMPT_BRANCH+="%{$reset_color}"
}

function prompt_status() {
  # Unstaged changes?
  if $(git diff-index --quiet --cached HEAD -- &>/dev/null); then
    PROMPT_STATUS="💔"

  # Staged changes?
  elif $(git diff-files --quiet &>/dev/null); then
    PROMPT_STATUS="🧡"

  # No changes
  else
    PROMPT_STATUS="💜"
  fi
}

function generate_prompt() {
  prompt_atom()
  prompt_dirname() 
  prompt_branch()
  prompt_status()
  echo "$PROMPT_ATOM $PROMPT_DIRNAME $PROMPT_BRANCH $PROMPT_STATUS %{$reset_color%}"
}

PROMPT="$(generate_prompt)"



#
# SSH
#
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_atom-nixos
