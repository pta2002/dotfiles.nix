{ pkgs, config, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/pta2002/nixvim";
    ref = "main";
  });
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
      expandtab = 2;
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
