# NixOS dotfiles
These should be placed on `~/.config/nixpkgs`, except for the `nixos`
directory, which should go on `/etc/config/nixos`.

home-manager is used to generate the configs for all the programs.

My [dotfiles repo](https://github.com/pta2002/dotfiles) is required for this to
work as intended. Ideally this will be made part of this repo, with the
symlinks managed by home-manager instead of by stow.
