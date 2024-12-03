# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ lib, pkgs, ... }:

{

  # wsl comes from flake import
  wsl.enable = true;
  wsl.defaultUser = "atom";

  # Enable required features and the utilities they require
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
    gcc
    clang
  ];
  
  security.sudo.wheelNeedsPassword = true;
  users.mutableUsers = false;
  users.users.atom = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "atom";
    shell = pkgs.zsh;
  };
  # Must be enabled here as well to set the default shell
  programs.zsh.enable = true;



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
