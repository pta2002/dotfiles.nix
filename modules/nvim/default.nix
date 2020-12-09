{ pkgs, config, ... }:
{
  imports = [
    ../colorscheme.nix
    ./lsp
    ./plugins/completion-nvim.nix
  ];

  programs.neovim = {
    enable  = true;
    package = pkgs.neovim-nightly;

    lsp.clangd.enable = true;
    lsp.rust-analyzer.enable = true;
    lsp.rnix-lsp.enable = false;

    lsp.onAttach = builtins.readFile ./lsp_attach.lua;

    viAlias  = true;
    vimAlias = true;

    extraConfig = builtins.readFile ./init.vim;

    completion-nvim.enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-toml

      vim-commentary
      editorconfig-vim

      {
        plugin = nvim-treesitter;
        config = ''
          lua <<EOF
          require'nvim-treesitter.configs'.setup {
            ensure_installed = "maintained",
            highlight = {
              enable = true,
            },
          }
          EOF
        '';
      }

      config.user.colorscheme.vimPlugin

      lightline-vim
    ];
  };
}
