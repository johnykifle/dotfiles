{ config, pkgs, ... }:

{
  # my global gitignore
  home.file."gitignore" = {
    text = ''
    tags
    .DS_Store
    '';
    target = ".gitignore";
  };

  programs.git = {
    enable = true;
    userName = "johnykifle@gmail.com";
    userEmail = "johnykifle@gmail.com";

    extraConfig = {
      core = {
        excludesFile = "~/.gitignore";
      };
      pull = {
        rebase = false;
      };
      url = {
        "ssh://git@github.com" = {
          insteadOf = "https://github.com";
        };
      };

    };
  };

}
