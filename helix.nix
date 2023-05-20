{ config, lib, pkgs, ... }: {

  programs.helix = {
    
    enable = true;

    settings = {
      theme = "onedark";
      editor = {
         line-number = "relative";
         lsp.display-messages = true;
         auto-save = true;
         bufferline = "always";
         
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };

    languages =      [
        {
           auto-format = true;
           name = "elm";
        }
     ];
  };
}

