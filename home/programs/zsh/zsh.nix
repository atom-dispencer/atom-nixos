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

      initExtra = builtins.readFile ./initExtra.zsh;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };
    };

    programs.zoxide = {
      enable = true;
    };
}
