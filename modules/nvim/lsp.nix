{ config, pkgs, lib, ... }:
with lib;
{
  imports = [
    ./lsp/clangd.nix
    ./lsp/rust-analyzer.nix
  ];

  options = {
    programs.neovim.lsp = {
      enable = mkEnableOption "nvim LSP";
    };
  };

  config = mkIf config.programs.neovim.lsp.enable {
    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        popfix
        { plugin = nvim-lsputils;
          config = ''
            lua <<EOF
            vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
            vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
            vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
            vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
            vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
            vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
            vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
            vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
            EOF
          ''; }
      ];

      # TODO Build a generator!
      # extraConfig = "";
    };
  };
}
