{
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      completionInit = ''
        # Use tab to complete commands
        bindkey '	' autosuggest-accept
        # Enable git completions (and others)
        autoload -U compinit && compinit -i
      '';

      initExtra = builtins.readFile ./initExtra.zsh;
    };

    file = {
      ".zsh/_git" = {
        source = "./_git";
      };

      ".zsh/git-completion.bash" = {
        source = "./git-completion.bash";
      };
    };
}
