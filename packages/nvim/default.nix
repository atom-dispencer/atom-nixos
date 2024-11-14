{ config, pkgs, ... }: {

  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };
}
