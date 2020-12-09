{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.programs.neovim.completion-nvim;
in
{
  imports = [
    ../lsp
  ];

  options = {
    programs.neovim.completion-nvim = {
      enable = mkEnableOption "completion-nvim";

      config = mkOption {
        type = types.lines;
        default = ''
          set completeopt=menuone,noinsert
          set shortmess+=c
          inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
          inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      plugins = [
        { plugin = pkgs.vimPlugins.completion-nvim;
          config = cfg.config; }
      ];

      lsp.enable = true;
      lsp.onAttach = ''
        require'completion'.on_attach(client)
      '';
    };
  };
}
