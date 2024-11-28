{ inputs, pkgs, ... }: {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = nixpkgs-unstable.neovim;
  };
}
