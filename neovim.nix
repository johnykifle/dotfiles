{ config, lib, pkgs, ... }:

let
  easygrep = pkgs.vimUtils.buildVimPlugin {
    name = "vim-easygrep";
    src = pkgs.fetchFromGitHub {
      owner = "dkprice";
      repo = "vim-easygrep";
      rev = "d0c36a77cc63c22648e792796b1815b44164653a";
      sha256 = "0y2p5mz0d5fhg6n68lhfhl8p4mlwkb82q337c22djs4w5zyzggbc";
    };
  };

in {
  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraPackages = with pkgs; [ ripgrep fzf bat nerdfonts ];

    plugins = with pkgs.vimPlugins; [
      easygrep
      vim-plug
      nerdtree-git-plugin
      nerdtree

      #Fancy status line at the bottom
      vim-airline

      fzf-vim
      vim-nix
      nvim-treesitter
      vim-grammarous
      ctrlp-vim
      vim-devicons
      vimagit
      vim-indent-guides
      vim-surround
      which-key-nvim
      markdown-preview-nvim
      registers-nvim
      auto-pairs


      #A collection of language packs for Vim.
      vim-polyglot
      git-blame-nvim
      
      # Comment stuff out
      vim-commentary

      # select by indentation
      vim-indent-object

      # Themese 
      #vimPlugins.gruvbox
      #tokyonight-nvim
      dracula-nvim

      #LSP choices
      #coc-nvim
      nvim-lspconfig

      ## Autocomplete
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp

      cmp-vsnip
      vim-vsnip


      nvim-web-devicons
      plenary-nvim


      gitsigns-nvim

      telescope-nvim

     
    ];


      # luafile ${builtins.toString ./lua/coq.lua}

    extraConfig = builtins.concatStringsSep "\n" [
      ''

         luafile ${builtins.toString ./lua/builtins.lua}
         luafile ${builtins.toString ./lua/autocomplete.lua}
         luafile ${builtins.toString ./lua/nvim-treesitter.lua}


         ${builtins.readFile ./vimrc}
     ''
    ];


  };
}

