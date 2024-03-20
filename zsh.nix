{ config, pkgs, ... }:

{
  programs.zsh = {

    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";

      plugins = [
        "docker"
        "docker-compose"
        "golang"
        "1Password"

        /* {
             name = "zsh-nix-shell";
             file = "nix-shell.plugin.zsh";
             src = pkgs.fetchFromGitHub {
               owner = "chisui";
               repo = "zsh-nix-shell";
               rev = "v0.5.0";
               sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
             };
           }
        */
      ];

    };

    initExtra = ''

      if [ -e /Users/yohanes/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/yohannes/.nix-profile/etc/profile.d/nix.sh; fi     # added by Nix installer
    '';
  };
}
