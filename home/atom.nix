{ 
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./programs
  ];

  home = {
    stateVersion = "24.05";
    username = "atom";
    homeDirectory = "/home/atom";

    shellAliases = {
      ex = "explorer.exe .";
    };

    # ~ twiddlin my thumbs ~
    packages = with pkgs; [
      # Shell environment
      oh-my-zsh
      neofetch

      # Utilities
      git
      wget
      curl
      unzip
      file
      cmake

      # C
      # No compilers or C build systems are included here because Nix causes issues with compiler 
      # paths on other Linux distributions
      # Just install gcc, make and clang manually, it's not that hard!
      gnumake
      bear
      llvmPackages_19.clang-tools
      # Go
      go
      # Haskell
      # ghc
      # cabal-install
      # haskell-language-server
      # JS
      nodejs_22
      # Julia
      # julia_19-bin
      # Lua
      luarocks-nix
      # Matlab
      # matlab-language-server
      # Python
      python313

    ];
  };
}
