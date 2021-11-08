{ pkgs, config, ... }:
{
  imports = [
    ../colorscheme.nix
    ./lsp
    ./plugins/completion-nvim.nix
  ];

  home.packages = with pkgs; [
    neovim-nightly
    clang-tools
    haskell-language-server ghc cabal-install
    rust-analyzer rustfmt
    pyright
    nodePackages.typescript-language-server
    jdk maven
    gopls
    pyright
  ];
}
