self: super:
{
  picom-ibhagwan = super.picom.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "ibhagwan";
      repo = "picom";
      rev    = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
      sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
    };
  });
}
