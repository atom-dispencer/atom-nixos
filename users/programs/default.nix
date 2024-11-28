{ 
  ... 
}: {

  imports = [
    ./git.nix
    ./nvim.nix
    ./zsh.nix
  ];
  
  programs.home-manager.enable = true;
}
