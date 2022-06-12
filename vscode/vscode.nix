{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      #vs code theme
      mskelton.one-dark-theme

      #docker 
      ms-azuretools.vscode-docker

      # Prettier
      esbenp.prettier-vscode

      #Markdown
      yzhang.markdown-all-in-one

      #Elm
      elmtooling.elm-ls-vscode

      #Git lens
      eamodio.gitlens

      #Go
      golang.go

      #Graphql
      graphql.vscode-graphql

      #Nix
      bbenoist.nix
    ];

    userSettings = {
      "breadcrumbs.enabled" = true;
      "terminal.integrated.fontFamily" = "PragmataPro Liga";
      "workbench.fontAliasing" = "antialiased";
      "workbench.editor.enablePreview" = false;
      "workbench.colorTheme" = "One Dark";
      "files.autoSave" = "afterDelay";
      "files.exclude" = { "**/node_modules/**" = true; };
      "files.trimTrailingWhitespace" = true;
      "editor.useTabStops" = false;
      "editor.tabSize" = 2;
      "editor.minimap.enabled" = false;
      "editor.lineHeight" = 20;
      "editor.fontSize" = 14;
      "editor.foldingMaximumRegions" = 5000;
      "editor.formatOnSave" = true;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "'Fira Code'";
      "editor.fontWeight" = "300";

      # Elm 
      "elmLS.elmPath" = "/Users/yohannes/.nix-profile/bin/elm";
      "elmLS.elmFormatPath" = "/Users/yohannes/.nix-profile/bin/elm-format";
      "elmLS.elmReviewPath" =
        "/Users/yohannes/Dx/projects/fiveten/office/node_modules/.bin/elm-review";
      "elmLS.elmTestPath" =
        "/Users/yohannes/Dx/projects/fiveten/office/node_modules/.bin/elm-test";
    };

    keybindings = [{
      key = "shift+cmd+d";
      command = "editor.action.copyLinesDownAction";
      when = "editorTextFocus && !editorReadonly";
    }];

  };

}
