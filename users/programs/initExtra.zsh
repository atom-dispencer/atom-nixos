
#
# ZSH Prompt
#

function is_git_repo() {
  git rev-parse --is-inside-work-tree &>/dev/null
}

function prompt_atom() {
  if $?; then
    echo "%{$fg_bold[blue]%}"
  else
    echo "%{$fg_bold[magenta]%}"
  fi

  echo "  $? "
  echo "%{$reset_color}"
}

function prompt_dirname() {
  echo "%{$fg_bold[blue]%}"
  echo '${PWD##*/}'
  echo "%{$reset_color}"
}

function prompt_branch() {
  echo "%{$fg_bold[blue]%}"

  if is_git_repo; then
    git branch --show-current
  fi

  echo "%{$reset_color}"
}

function prompt_status() {
  # Unstaged changes?
  if $(git diff-index --quiet --cached HEAD --); then
    echo "💔"

  # Staged changes?
  else
    echo "🧡"

  # No changes
  else
    echo "💜"
  fi
}

function generate_prompt() {
  echo "$(prompt_atom)  $(prompt_dirname) $(prompt_branch) $(prompt_status) %{$reset_color%} "
}

PROMPT='$(generate_prompt)'



#
# SSH
#
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_atom-nixos
