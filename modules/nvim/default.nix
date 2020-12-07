{ pkgs, ... }:
let
  colorscheme = {
    vimPlugin.package = pkgs.vimPlugins.gruvbox;
    vimPlugin.name = "gruvbox";
  };
  # colorscheme = {
  #   vimPlugin.package = pkgs.vimPlugins.oceanic-next;
  #   vimPlugin.name = "OceanicNext";
  # };
in
{
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

      { plugin = colorscheme.vimPlugin.package;
        config = "colorscheme ${colorscheme.vimPlugin.name}"; }
      { plugin = lightline-vim;
        config = "let g:lightline = { 'colorscheme': '${colorscheme.vimPlugin.name}' }"; }
    ];
  };
}
