{ pkgs, config, ... }:
{
  imports = [
    ../colorscheme.nix
  ];

  programs.neovim = {
    enable  = true;
    package = pkgs.neovim-nightly;

    viAlias  = true;
    vimAlias = true;

    extraConfig = builtins.readFile ./init.vim;

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
