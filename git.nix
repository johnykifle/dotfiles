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
    userName = "Yohannes";
    userEmail = "johnykifle@gmail.com";

    extraConfig = {
      core = {
        excludesFile = "~/.gitignore";
        editor = "nvim";
      };
      pull = {
        rebase = false;
      };
      url = {
        "ssh://git@github.com" = {
          insteadOf = "https://github.com";
        };
      };
      merge = {
        tool = "nvim";
      };
    };
     delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        #syntax-theme = "GitHub";
        syntax-theme = "1337";
        plus-color = "#32473d";
        minus-color = "#643632";
        features = "side-by-side line-numbers";
        whitespace-error-style = "22 reverse";
      };
    };

  };

}
