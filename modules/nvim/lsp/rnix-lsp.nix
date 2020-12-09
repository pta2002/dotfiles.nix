{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.programs.neovim.lsp.rnix-lsp;
in
{
  options = {
    programs.neovim.lsp.rnix-lsp = {
      enable = mkEnableOption "rnix LSP";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim.extraPackages = [ pkgs.rnix-lsp ];

    programs.neovim.lsp.enable = true;
    programs.neovim.lsp.langServers = [ "'rnix'" ];
  };
}
