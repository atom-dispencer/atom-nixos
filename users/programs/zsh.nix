{
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      completionInit = ''
        # Use tab to complete commands
        bindkey '	' autosuggest-accept
      '';

      initExtra = ''
        #
        # Prompt
        #

        # Git prompt configuration
        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
        ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{💔%}"
        ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[yellow]%}%1{💜%}"

        # Change atom colour if the last command succeeded/failed
        PROMPT="%(?:%{$fg_bold[magenta]%}%1{%} :%{$fg_bold[red]%}%1{%} ) "
        # User in white
        PROMPT+="%{$fg[white]%}%n%{$reset_color%} "
        # Blue current directory
        PROMPT+="%{$fg[blue]%}%c%{$reset_color%} "
        # Git info (MUST be single ' quotes to make it a STRING and NOT evaluate it now)
        PROMPT+='$(_omz_git_prompt_info)'
        # Remove the janky right-hand-side git prompt made automagically by oh-my-zsh
        RPROMPT=""

        #
        # SSH
        #
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/github_atom-nixos

        #
        # Python
        # nix-ld
        # This apparently might cause issues with other libraries, but we'll deal with that later
        # https://github.com/mcdonc/.nixconfig/blob/e7885ad18b7980f221e59a21c91b8eb02795b541/videos/pydev/script.rst
        #
        export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "git-prompt"
        ];
      };
    };
}
