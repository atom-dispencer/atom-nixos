{ pkgs, nixvim, ... }: {

  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}
