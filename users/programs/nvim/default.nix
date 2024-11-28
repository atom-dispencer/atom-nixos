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
    source = config.lib.file.mkOutOfStoreSymlink ./atom-nvim;
    recursive = true;
  };
}
