{ config, pkgs, lib, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  users.users.yohannes = {
    name = "yohannes";
    home = "/Users/yohannes";
  };

  home-manager.users.yohannes = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    home.packages = [
      pkgs.nodejs-14_x
      pkgs.yarn
      pkgs.zsh-autosuggestions
      pkgs.zsh-autocomplete
      pkgs.aws
      pkgs.aws-vault
      pkgs.pass
      pkgs.gnupg
      pkgs.direnv

      #Elm
      pkgs.elmPackages.elm
      pkgs.elmPackages.elm-format
      pkgs.elmPackages.elm-test

      pkgs.nixfmt

    ];

    imports =
      [ ./vscode/vscode.nix ./zsh.nix ./git.nix ./neovim.nix ./tmux.nix ];

    programs = {

      htop = { enable = true; };

      jq.enable = true;

      fzf.enable = true;
      fzf.enableZshIntegration = true;

      direnv.enable = true;
      direnv.nix-direnv.enable = true;
    };

  };

}
