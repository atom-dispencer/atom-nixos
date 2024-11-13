{ pkgs, ... }: {
  
  imports = [
    ../packages
  ];

  home.username = "atom";
  home.homeDirectory = "/home/atom";

  # home.packages = with pkgs; [
  #  neovim
  # ];
}
