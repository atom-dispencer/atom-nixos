{ 
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./atom.nix
  ];

  programs.git.signing.key = "~/.ssh/github_atom-wsl.pub";

  home = {
    shellAliases = {
      ex = "explorer.exe .";
    };
  };
}
