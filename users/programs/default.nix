{ pkgs, ... }: {

  imports = [
    ./nvim
    ./git.nix
    ./zsh.nix
  ];
  
  programs.home-manager.enable = true;
}
