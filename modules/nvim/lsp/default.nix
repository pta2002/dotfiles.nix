{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.programs.neovim.lsp;
in
{
  imports = [
    ./clangd.nix
    ./rnix-lsp.nix
    ./rust-analyzer.nix
  ];

  options = {
    programs.neovim.lsp = {
      enable = mkEnableOption "nvim LSP";

      langServers = mkOption {
        type = types.listOf types.str;
        description = "A list of language servers to be enabled";
        default = [];
      };

      onAttach = mkOption {
        type = types.lines;
        description = "A lua function to be run when a new LSP buffer is attached";
        default = "";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      extraPackages = [ pkgs.bat ];
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

      # Generate a nice config for enabling all the LSP servers
      extraConfig = ''
        " {{{ LSP
        lua <<EOF
        local lspList = { ${concatStringsSep "," cfg.langServers} }
        local onAttach = function(client)
          ${cfg.onAttach}
        end

        for i,server in ipairs(lspList) do
          if type(server) == "string" then
            require('lspconfig')[server].setup {
              on_attach = onAttach
            }
          else
            require('lspconfig')[server.name].setup(server.extraOptions)
          end
        end
        EOF
        " }}}
      '';
    };
  };
}
