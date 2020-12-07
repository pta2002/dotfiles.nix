{ config, pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-lsputils
    ];

    # TODO Build a generator!
    # extraConfig = "";
  }
}
