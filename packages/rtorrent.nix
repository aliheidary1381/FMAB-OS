{ pkgs }:
let
  version = "v0.9.8-r16";
in
pkgs.stdenv.mkDerivation {
  pname = "rtorrent-linux-arm64";
  version = version;

  src = pkgs.fetchurl {
    url = "https://github.com/jesec/rtorrent/releases/download/${version}/rtorrent-linux-amd64";
    sha256 = "0h4bvhwdqkybwyi4sscnr5nkkf2rfn9y9zcavs2rp9pcj9xkck4p";
  };

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
    pkgs.makeWrapper
  ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/rtorrent
    chmod +x $out/bin/rtorrent
  '';

  meta = with pkgs.lib; {
    description = "Ncurses client for libtorrent, ideal for use with screen, tmux, or dtach (jesec's fork)";
    homepage = "https://github.com/jesec/rtorrent";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}
