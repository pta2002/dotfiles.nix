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
        bookmarks = [
          { n = "~/.config/nixpkgs/modules/nvim/default.nix"; }
          { l = "~/Projects/li3"; }
          { u = "~/Uni"; }
        ];
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

      zig.enable = true;
      nix.enable = true;

      barbar.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-toml
      vim-surround
      editorconfig-vim
      vim-table-mode
      tabular
      vim-markdown
      vim-hcl

      vim-terraform
      vim-elixir
      auto-pairs
    ];

    options = {
      # Enable mouse
      mouse = "a";

      # Show line numbers
      number = true;

      # Indentation is 2 spaces
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smarttab = true;
      autoindent = true;
      cindent = true;

      # Wrap lines
      linebreak = true;

      # Let me switch buffers without saving
      hidden = true;

      # Don't create a swap file
      nobackup = true;

      # Show a popup when autocompleting
      wildmenu = true;
      cot = [ "menuone" "preview" ];

      # Case-insensitive search and tab complete
      ignorecase = true;

      # Split to the right instead of to the left
      splitright = true;
    };

    globals = {
      # Highlight lua code embeded in vimscript files
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
