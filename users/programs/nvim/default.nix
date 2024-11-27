{

  programs.neovim = {
    enable = true;
    #defaultEditor = true;
    #viAlias = true;
    #vimAlias = true;

    #colorschemes.catppuccin.enable = true;
    #plugins.lualine.enable = true;
  };

  home.file.".config/nvim" = {
    source = ./atom-nvim/;
    recursive = true;
  };
}
