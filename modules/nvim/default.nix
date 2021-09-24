{ pkgs, config, ... }:
{
  imports = [
    ../colorscheme.nix
    ./lsp
    ./plugins/completion-nvim.nix
  ];

  home.packages = with pkgs; [
    neovim
    clang-tools
    haskell-language-server ghc cabal-install
    pyright
    jdk maven
  ];
}
