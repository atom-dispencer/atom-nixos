{
  programs.git = {
    enable = true;
    userName = "Adam Spencer";
    userEmail = "46679475+atom-dispencer@users.noreply.github.com";
    signing.signByDefault = true;

    extraConfig = {
      gpg.format = "ssh";
    };
  };
}
