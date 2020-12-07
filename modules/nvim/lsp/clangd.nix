{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.programs.neovim.lsp.clangd;
in
{
  options = {
    programs.neovim.lsp.clangd = {
      enable = mkEnableOption "clangd LSP";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim.extraPackages = [ pkgs.clang-tools ];

    programs.neovim.extraConfig = ''
      lua require'lspconfig'.clangd.setup{}
    '';

    programs.neovim.lsp.enable = true;
  };
}
