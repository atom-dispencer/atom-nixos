{ 
  config,     # The whole config so far
  nixpkgs,
  inputs,     # Input map from flake.nix, contains nixpkgs home-manager modules etc.
  ...         # The contents of moduleargs, unpacked
}: {

  home.username = "atom";
  home.homeDirectory = "/home/atom";

  programs.fish = {
    enable = true;
  }

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
