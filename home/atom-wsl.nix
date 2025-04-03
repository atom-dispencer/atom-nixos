{ 
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./atom.nix
  ];

  home = {
    shellAliases = {
      ex = "explorer.exe .";
    };
  };
}
