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
    jdk17
    # maven
    (maven.override {
      jdk = jdk17;
    })
    gopls
    pyright
    coursier metals dotty sbt
  ];
}
