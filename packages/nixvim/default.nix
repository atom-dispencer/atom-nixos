{ pkgs, nixvim, ... }: {

  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}
