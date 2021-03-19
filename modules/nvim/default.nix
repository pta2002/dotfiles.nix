{ pkgs, config, ... }:
let
#  nixvim = import (builtins.fetchTarball {
#    url = "https://github.com/pta2002/nixvim/archive/7aa8c221385ad2e6e090eab6bd32cbb850ff2de3.tar.gz";
#    sha256 = "1nbig9xsc33m4vs17k86dxg5k99ibcxz40s8mmvqwwlfak59dc60";
#  });
  nixvim = import /home/pta2002/Projects/nixvim;
in
{
  imports = [
    ../colorscheme.nix
    ./lsp
    ./plugins/completion-nvim.nix
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-nightly;

    colorschemes.onedark.enable = true;

    plugins = {
      lsp = {
        enable = true;
        servers.clangd.enable = true;
      };

      treesitter = {
        enable = true;
        disabledLanguages = [ "ledger" ];
      };

      airline = {
        enable = true;
        powerline = true;
      };

      startify = {
        enable = true;
        useUnicode = true;
      };

      telescope = {
        enable = true;
        extensions.frecency.enable = true;
      };

      lspsaga.enable = true;
      commentary.enable = true;
      ledger.enable = true;
      nvim-autopairs.enable = true;
      undotree.enable = true;
      gitgutter.enable = true;
      fugitive.enable = true;

    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-toml
      vim-nix
      vim-surround
      editorconfig-vim
      vim-table-mode
      tabular
      vim-markdown

      vim-terraform
      vim-elixir
      auto-pairs
    ];

    options = {
      mouse = "a";
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smarttab = true;
      autoindent = true;
      cindent = true;
      linebreak = true;
      hidden = true;

      nobackup = true;
      cot = [ "menuone" "preview" ];

      wildmenu = true;
      ignorecase = true;
    };

    globals = {
      vimsyn_embed = "l";
      mapleader = " ";
    };

    maps = {
      normalVisualOp."ç" = ":";
      normalVisualOp."-" = "/";
      normal."j" = "gj";
      normal."k" = "gk";
    };
  };
}
