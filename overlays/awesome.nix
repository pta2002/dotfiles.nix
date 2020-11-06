self: super:
{
  awesome-nightly = super.awesome.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev    = "538586c170cffebca405c005b63f68b125f3d340";
      sha256 = "017s4kkdh980lrk3xibh1f981b0q7kk092xff6r1dfgybrphcjih";
    };
  });
}
