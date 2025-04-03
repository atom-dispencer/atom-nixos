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
      alacritty
    ];

    sessionVariables = {
      OS_TYPE = "PopOS";
    };
  };
}
