{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.programs.neovim.lsp.rust-analyzer;
in
{
  options = {
    programs.neovim.lsp.rust-analyzer = {
      enable = mkEnableOption "rust-analyzer LSP";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim.extraPackages = [ pkgs.rust-analyzer ];

    programs.neovim.extraConfig = ''
      lua require'lspconfig'.rust_analyzer.setup{}
    '';

    programs.neovim.lsp.enable = true;
  };
}
