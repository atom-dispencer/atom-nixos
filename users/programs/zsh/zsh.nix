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
    };

    home.file = {
      ".zsh/_git" = {
        source = "./_git";
      };

      ".zsh/git-completion.bash" = {
        source = "./git-completion.bash";
      };
    };
}
