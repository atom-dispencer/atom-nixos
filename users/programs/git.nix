{
  programs.git = {
    enable = true;
    userName = "Adam Spencer";
    userEmail = "46679475+atom-dispencer@users.noreply.github.com";
    signing.signByDefault = true;
    signing.key = "~/.ssh/github_atom-nixos.pub";

    extraConfig = {
      gpg.format = "ssh";
    };
  };
}
