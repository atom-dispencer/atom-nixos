{ 
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./atom.nix
  ];

  home = {
    packages = with pkgs; [
      neofetch
    ];

    sessionVariables = {
      OS_TYPE = "PopOS";
    };
  };
}
