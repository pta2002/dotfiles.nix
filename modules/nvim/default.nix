{ pkgs, ... }:
{
  programs.neovim = {
    enable  = true;
    package = pkgs.neovim-nightly;

    viAlias  = true;
    vimAlias = true;

    extraConfig = builtins.readFile ./init.vim;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox

      { plugin = lightline-vim;
        config = "let g:lightline = { 'colorscheme': 'gruvbox' }"; }
    ];
  };
}
