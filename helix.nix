{ config, lib, pkgs, ... }: {

  programs.helix = {
    
    enable = true;

    settings = {
      theme = "onedark";
      editor = {
         true-color= true;
         line-number = "relative";
         lsp.display-messages = true;
         auto-save = true;
         bufferline = "always";
         statusline = {
           mode = {
             normal = "NORMAL";
             insert = "INSERT";
             select = "SELECT";
          };
           
        };       
                 
         file-picker = {
          hidden = true;
         };
         
         cursor-shape = {
           insert = "bar";
           normal = "block";
           select = "underline";
         };

        indent-guides = {
          render = true;
          character = "╎"; # Some characters that work well: "▏", "┆", "┊", "⸽"
          skip-levels = 1;
        };         
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };

    languages = { 
      language = [
        {
           auto-format = true;
           name = "elm";
        }
      ];
      };
    };
}

