{ 
  inputs,
  pkgs,
  ...
}: {

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  imports = [
    ./programs
  ];

  home = {
    username = "atom";
    homeDirectory = "/home/atom";
    
    packages = with pkgs; [
      oh-my-zsh
    ];
  };

  home.stateVersion = "24.05";
}
