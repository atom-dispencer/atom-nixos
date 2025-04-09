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
      # Only install compilers / C build systems on WSL/NixOS because outside of NixOS their paths
      # experience critical existence failure and you get loads of weird loading-order macro errors
      (hiPrio gcc)
      clang
      gnumake
    ];

    shellAliases = {
      ex = "explorer.exe .";
    };
  };
}
