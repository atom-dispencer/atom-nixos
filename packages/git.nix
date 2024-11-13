{ pkgs, ... }: {
  # idk what this does
  # home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "Adam Spencer";
    userEmail = "46679475+atom-dispencer@users.noreply.github.com";
  };
}
