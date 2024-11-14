{ config, pkgs, ... }: {

  #home.file."${config.xdg.configHome}/nvim" = {
  #source = ./config/nvim;
  #recursive = true;
  #};

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}
