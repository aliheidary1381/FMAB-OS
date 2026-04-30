{
  pkgs,
  ...
}:
{
  my-fonts = import ./proprietary.nix { inherit pkgs; };
  parastoo = import ./parastoo.nix { inherit pkgs; };
  estedad = import ./estedad.nix { inherit pkgs; };
  estedad-mad = import ./estedad-mad.nix { inherit pkgs; };
  gandom = import ./gandom.nix { inherit pkgs; };
  sahel = import ./sahel.nix { inherit pkgs; };
  lalezar = import ./lalezar.nix { inherit pkgs; };
}
