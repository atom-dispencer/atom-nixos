{ pkgs, ... }: {

  imports = [
    ./fish.nix
    ./git.nix
    ./nixvim
  ];
  
  home-manager.enable = true;
}
