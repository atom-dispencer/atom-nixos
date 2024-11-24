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
        ATOM_PURPLE=$(tput setaf 129)
        # Green/Red arrow if the last command succeeded/failed
        PROMPT="%(?:%{$fg_bold[ATOM_PURPLE]%}%1{%} :%{$fg_bold[red]%}%1{%} ) "
        # User in white
        PROMPT+="%{$fg[white]%}%n%{$reset_color%} "
        # Cyan current directory
        PROMPT+="%{$fg[cyan]%}%c%{$reset_color%} "
        # Git info
        PROMPT+="$(git_prompt_info)"

        # Git prompt configuration
        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
        ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
        ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
      };
    };
  };

  home.stateVersion = "24.05";
}
