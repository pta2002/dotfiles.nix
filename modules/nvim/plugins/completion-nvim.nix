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

      completionTimer = mkOption {
        type = types.int;
        default = 400;
        description = "how long to wait until the completion pops up";
      };

      config = mkOption {
        type = types.lines;
        default = ''
          set completeopt=menuone,noinsert,noselect
          set shortmess+=c
          inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
          inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

          let g:completion_timer_cycle = ${builtins.toString cfg.completionTimer}
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
