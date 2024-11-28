{ config, ... }: {

  programs.neovim = {
    enable = true;
    #defaultEditor = true;
    #viAlias = true;
    #vimAlias = true;

    #colorschemes.catppuccin.enable = true;
    #plugins.lualine.enable = true;
  };

  home.file.".config/nvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/atom-dispencer/atom-nvim.git";
      rev = "411bc1c68351bb059ce0b33e17309dba7c9d0263";
    };
  };
}
