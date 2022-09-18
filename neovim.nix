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

    plugins = with pkgs; [
      easygrep
      vimPlugins.vim-plug
      vimPlugins.nerdtree-git-plugin
      vimPlugins.nerdtree

      #Fancy status line at the bottom
      vimPlugins.vim-airline

      vimPlugins.fzf-vim
      vimPlugins.vim-nix
      vimPlugins.nvim-treesitter
      vimPlugins.vim-grammarous
      vimPlugins.ctrlp-vim
      vimPlugins.vim-devicons
      vimPlugins.vimagit
      vimPlugins.vim-indent-guides
      vimPlugins.vim-surround
      vimPlugins.which-key-nvim
      vimPlugins.markdown-preview-nvim
      vimPlugins.registers-nvim
      vimPlugins.auto-pairs

      #A collection of language packs for Vim.
      vimPlugins.vim-polyglot
      vimPlugins.git-blame-nvim

      vimPlugins.vim-code-dark

      vimPlugins.coc-nvim

    ];

    extraConfig = ''

      " Enable syntax highlighting
      syntax enable


       " Add `:Format` command to format current buffer.
       command! -nargs=0 Format :call CocActionAsync('format')

      " Set utf8 as standard encoding and en_US as the standard language

      set encoding=UTF-8


      " Sets how many lines of history VIM has to remember
      set history=500

      " Enable filetype plugins
      filetype plugin on
      filetype indent on

      
      " Activates italicized comments (make sure your terminal supports italics)
      let g:codedark_italics=1
      
      " Make the background transparent
      let g:codedark_transparent=1
      
      " If you have vim-airline, you can also enable the provided theme
      let g:airline_theme = 'codedark'
      
      "Enable theme
      colorscheme codedark


      set mouse=a
      set relativenumber

      " Autosave when navigating between buffers
      set autowrite

      " Set to auto read when a file is changed from the outside
      set autoread

      " :W sudo saves the file
      " (useful for handling the permission-denied error)
      command W w !sudo tee % > /dev/null

      "Always show current position
      set ruler

      " Height of the command bar
      set cmdheight=2

      " A buffer becomes hidden when it is abandoned
      set hidden

      " Configure backspace so it acts as it should act
      set backspace=eol,start,indent
      set whichwrap+=<,>,h,l

      " Ignore case when searching
      set ignorecase

      " When searching try to be smart about cases
      set smartcase

      " Highlight search results
      set hlsearch

      " Makes search act like search in modern browsers
      set incsearch
      " Show matching brackets when text indicator is over them
      set showmatch

      " How many tenths of a second to blink when matching brackets
      set mat=2

      " No annoying sound on errors
      set novisualbell

      " Use Unix as the standard file type
      set ffs=unix,dos,mac

      " Turn backup off, since most stuff is in SVN, git et.c anyway...
      set nobackup
      set nowb
      set noswapfile

      " Use spaces instead of tabs
      " set expandtab

      " Be smart when using tabs ;)
      set smarttab

      " 1 tab == 2 spaces
      set shiftwidth=2
      set tabstop=2
      set softtabstop=2

      " Linebreak on 500 characters
      set lbr
      set tw=500
      set ai "Auto indent
      set si "Smart indent
      set wrap "Wrap lines

      " Always show the status line
      set laststatus=2

      " Format the status line
      set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

      set number
      set autoindent

      inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
      
      set encoding=UTF-8
      set guifont=DroidSansMono_Nerd_Font:h24

      nmap <F6> :NERDTreeToggle<CR>

      let mapleader=";"
      inoremap ;; <Esc>

      let g:elm_format_autosave = 1
      " let g:ale_elm_analyse_use_global = 1

      autocmd Syntax elm setlocal foldmethod=indent
      autocmd Syntax elm normal zR

      " Auto start NERD tree when opening a directory
      autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

      " Auto start NERD tree if no files are specified
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

      " Let quit work as expected if after entering :q the only window left open is NERD Tree itself
      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


      " Use tab for trigger completion with characters ahead and navigate.
      " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
      " other plugin before putting this into your config.
      inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


      " GoTo code navigation.
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)

      " Use K to show documentation in preview window.
      nnoremap <silent> K :call ShowDocumentation()<CR>

      " Symbol renaming.
      nmap <leader>rn <Plug>(coc-rename)

      " Formatting selected code.
      xmap <leader>f  <Plug>(coc-format-selected)
      nmap <leader>f  <Plug>(coc-format-selected


      let g:coc_enable_locationlist = 0
      autocmd User CocLocationsChange CocList --no-quit --normal location


      "set guifont=DroidSansMono_Nerd_Font:h11
      "let g:webdevicons_enable_nerdtree = 1
      "let g:webdevicons_conceal_nerdtree_brackets = 1

      " This is the default extra key bindings
      let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

      " Default fzf layout
      " - Popup window (center of the screen)
      let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    

      "" Enable airline fonts
      let g:airline_powerline_fonts = 1

      ""
      let g:airline#extensions#tabline#enabled = 1

      "" Enable to show buffer nr, makes it easer to delete buffer
      let g:airline#extensions#tabline#buffer_nr_show = 1

      "" Change tabs using vim-airline
      nmap <leader>1 :bfirst<CR>
      nmap <leader>2 :bfirst<CR>:bn<CR>
      nmap <leader>3 :bfirst<CR>:2bn<CR>
      nmap <leader>4 :bfirst<CR>:3bn<CR>
      nmap <leader>5 :bfirst<CR>:4bn<CR>
      nmap <leader>6 :bfirst<CR>:5bn<CR>
      nmap <leader>7 :bfirst<CR>:6bn<CR>
    '';
  };
}

