{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "mediahuman-lyrics-finder";
  version = "1.7.0";

  src = pkgs.fetchurl {
    url = "https://www.mediahuman.com/download/LyricsFinder.amd64.deb";
    hash = "sha256-TNhZuu8+rBZt7CMPE+hD1D1Pb6IJCbRgT/GzZNkBN48=";
  };

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    qt5.wrapQtAppsHook
    dpkg
  ];

  buildInputs = with pkgs; [
    qt5.qtbase
    qt5.qtmultimedia
    qt5.qtquickcontrols2
    qt5.qtdeclarative
    qt5.qttools
    zlib
    stdenv.cc.cc.lib
  ];

  unpackPhase = ''
    dpkg-deb -x $src unpacked
  '';

  installPhase = ''
    install -Dm755 unpacked/opt/lyrics-finder/LyricsFinder $out/bin/lyricsfinder
    sed 's|Exec=.*|Exec=lyricsfinder %U|' unpacked/usr/share/applications/lyrics-finder.desktop > lyricsfinder.desktop
    install -Dm644 unpacked/usr/share/applications/lyrics-finder.desktop $out/share/applications/lyrics-finder.desktop
    cp -r unpacked/usr/share/lyrics-finder/locale $out/share/lyrics-finder/
    install -Dm644 unpacked/usr/share/icons/hicolor/1024x1024/apps/LyricsFinder.png $out/share/icons/hicolor/1024x1024/apps/LyricsFinder.png
    install -Dm644 unpacked/usr/share/icons/hicolor/512x512/apps/LyricsFinder.png $out/share/icons/hicolor/512x512/apps/LyricsFinder.png
    install -Dm644 unpacked/usr/share/icons/hicolor/256x256/apps/LyricsFinder.png $out/share/icons/hicolor/256x256/apps/LyricsFinder.png
    install -Dm644 unpacked/usr/share/icons/hicolor/128x128/apps/LyricsFinder.png $out/share/icons/hicolor/128x128/apps/LyricsFinder.png
    install -Dm644 unpacked/usr/share/icons/hicolor/64x64/apps/LyricsFinder.png $out/share/icons/hicolor/64x64/apps/LyricsFinder.png
    install -Dm644 unpacked/usr/share/icons/hicolor/32x32/apps/LyricsFinder.png $out/share/icons/hicolor/32x32/apps/LyricsFinder.png
    install -Dm644 unpacked/usr/share/icons/hicolor/16x16/apps/LyricsFinder.png $out/share/icons/hicolor/16x16/apps/LyricsFinder.png
  '';

  meta = with pkgs.lib; {
    description = "Find lyrics — search and add lyrics for all your music files automatically";
    homepage = "http://www.mediahuman.com/lyrics-finder/";
    license = licenses.unfree;
    maintainers = [ maintainers.unlisted ];
    platforms = platforms.linux;
    mainProgram = "lyricsfinder";
  };
}
