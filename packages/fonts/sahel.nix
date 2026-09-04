{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "sahel-fonts";
  version = "3.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "rastikerdar";
    repo = "sahel-font";
    rev = "master";
    hash = "sha256-EH3iXPaJ4KqkzRAwf5lJXudT8nHj78C0em3v8STF7+k=";
  };

  nativeBuildInputs = [ pkgs.installFonts ];
  dontInstallWebfonts = true;

  meta = with pkgs.lib; {
    description = "Persian (farsi) Font";
    homepage = "https://github.com/rastikerdar/sahel-font";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
