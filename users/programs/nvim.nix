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
      rev = "1ce7253620f681a417e32a7cc8b8d3fc3be13fa9";
    };
  };
}
