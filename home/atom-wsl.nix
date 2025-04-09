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
    packages = with pkgs; [
      (hiPrio gcc)
      clang
      gnumake
    ];

    shellAliases = {
      ex = "explorer.exe .";
    };
  };
}
