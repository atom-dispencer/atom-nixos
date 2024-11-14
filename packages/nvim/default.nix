{ config, pkgs, ... }: {

  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config/nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };
}
