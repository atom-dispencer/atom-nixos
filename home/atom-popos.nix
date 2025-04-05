{ 
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./atom.nix
  ];

  programs.git.signing.key = "~/.ssh/github_atom-popos.pub";

  home = {
    packages = with pkgs; [
      neofetch
    ];

    sessionVariables = {
      OS_TYPE = "PopOS";
    };
  };
}
