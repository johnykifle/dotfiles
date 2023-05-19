{ config, pkgs, lib, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  users.users.yohannes = {
    name = "yohannes";
    home = "/Users/yohannes";
  };

  home-manager.users.yohannes = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.11";

    home.packages = [
      pkgs.nodejs-14_x
      pkgs.yarn
      pkgs.zsh-autosuggestions
      pkgs.zsh-autocomplete
      pkgs.awscli
      pkgs.aws-vault
      pkgs.pass
      pkgs.gnupg
      pkgs.direnv
      pkgs.gitui
      pkgs.gzip
      pkgs.act
      pkgs.sqlite
      pkgs.python39
      pkgs._1password
      
      #Elm
      pkgs.elmPackages.elm
      pkgs.elmPackages.elm-format
      pkgs.elmPackages.elm-test
      pkgs.elmPackages.elm-language-server
      
      #Nix
      pkgs.niv
      pkgs.nixfmt


      #Node
      pkgs.nodePackages.np
      pkgs.nodePackages.serverless

      # Netlify cli
      pkgs.netlify-cli

    ];

    imports =
      [ ./vscode/vscode.nix ./zsh.nix ./git.nix ./neovim.nix ./tmux.nix ];

    programs = {

      htop = { enable = true; };

      jq.enable = true;

      fzf.enable = true;
      fzf.enableZshIntegration = true;

      direnv = {
        enable = true;
        config = {
          load_dotenv = false;
          strict_env = true;
        };
        nix-direnv.enable = true;
     };
    };

  };

}
