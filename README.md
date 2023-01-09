# Setup mac os for development with nix-darwn and home-manager 

Setting up your macos for development with Nix (nix-darwin)


## Setup
*  Install nix if you are using MacOs
     1. ```sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon```
     Or go through your ```https://nix.dev/tutorials/install-nix``` to find your OS.
     
*  Install nix-darwin and setup
     1. ```https://github.com/LnL7/nix-darwin```
  
* Home Manager provides a module that allows you to prepare user environments directly from the nix-darwin configuration file.

     1. Execute these in order.
          1.  ``` nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager ```
          2. ``` nix-channel --update ```
 
 If you need more info on how to configure home-manager with nix-darwin 
 ``` https://rycee.gitlab.io/home-manager/index.html#sec-install-nix-darwin-module```
 
 ### Lsp

 -  Default setup uses  nvim-lspconfig with autocompleteion nvim-comp, 

 - To setup nvim with coc
    change on neovim.nix this 
     ```
       #LSP choices
       #coc-nvim
       nvim-lspconfig

      ```
      to 
      
      ```
       #LSP choices
       coc-nvim
       #nvim-lspconfig

      ```

      copy `nvim-config/coc-settings.json` to `~/.config/nvim/`

      OR type 

      ``` :CocConfig ``` and paste the contents of you coc-settings.json
 
  

###  Building
  * To build the configuration run `darwin-rebuild switch`

