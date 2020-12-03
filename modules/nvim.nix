{ pkgs, ... }:
{
  programs.neovim = {
    enable  = true;
    package = pkgs.neovim-nightly;

    viAlias  = true;
    vimAlias = true;

    extraConfig = ''
      set nocompatible
      set nobackup

      set mouse=a

      colorscheme gruvbox

      map ç :
      map - /
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox

      { plugin = lightline-vim;
        config = "let g:lightline = { 'colorscheme': 'gruvbox' }"; }
    ];
  };
}
