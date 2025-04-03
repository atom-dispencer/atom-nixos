{ 
  ... 
}: {

  imports = [
    ./git.nix
    ./nvim.nix
    ./zsh
  ];
  
  programs.home-manager.enable = true;
}
