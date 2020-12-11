{ vimUtils, fetchFromGitHub }:
{
  vim-gruvbox8 = vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-gruvbox8";
    version = "2020-12-10";
    src = fetchFromGitHub {
      owner = "lifepillar";
      repo = "vim-gruvbox8";
      rev = "0cd81eaf85f5567f0f67172655ac145824ddeb3e";
      sha256 = "03fjkcap1qwr4nb9j1rdxg1bx11nx0h1xr58vhiy8i337255pyxj";
    };
    dependencies = [];
  };
}
