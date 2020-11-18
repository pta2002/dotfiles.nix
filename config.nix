{
  allowUnfree = true;

  packageOverrides = pkgs: {
    bitwig-studio3 = pkgs.bitwig-studio3.overrideAttrs (oldAttrs: {
      runtimeDependencies = oldAttrs.runtimeDependencies ++ [ pkgs.libjack2 ];
    });
  };
}
