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
      # Do NOT try to install C compilers or build systems here!!
      # The paths will all break with weird errors!!
      neofetch
    ];

    sessionVariables = {
      OS_TYPE = "PopOS";
    };
  };
}
