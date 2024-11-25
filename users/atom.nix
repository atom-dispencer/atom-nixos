{ 
  pkgs,
  ...
}: {

  home = {
    username = "atom";
    homeDirectory = "/home/atom";
    
    packages = with pkgs; [
      oh-my-zsh
    ];
  };

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        # Git prompt configuration
        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
        ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{💔%}"
        ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[yellow]%}%1{💜%}"

        # Green/Red arrow if the last command succeeded/failed
        PROMPT="%(?:%{$fg_bold[magenta]%}%1{%} :%{$fg_bold[red]%}%1{%} ) "
        # User in white
        PROMPT+="%{$fg[white]%}%n%{$reset_color%} "
        # Blue current directory
        PROMPT+="%{$fg[blue]%}%c%{$reset_color%} "
        # Git info (MUST be single ' quotes to make it a STRING and NOT evaluate it now)
        PROMPT+='$(_omz_git_prompt_info)'
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "git-prompt"
        ];
      };
    };

    neovim = {
      enable = true;
    };
  };

  home.stateVersion = "24.05";
}
