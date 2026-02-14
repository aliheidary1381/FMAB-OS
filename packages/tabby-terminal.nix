{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "tabby";
  version = "1.0.230";

  src = pkgs.fetchurl {
    url = "https://github.com/Eugeny/${pname}/releases/download/v${version}/${pname}-${version}-linux-x64.deb";
    hash = "sha256-ZDyUIADOS2vvfRX485ae7Q7fhtGG24vsDRRMnlAqnQk=";
  };

  nativeBuildInputs = with pkgs; [
    dpkg
    autoPatchelfHook
    wrapGAppsHook3
  ];

  buildInputs = with pkgs; [
    glib
    gtk3
    gsettings-desktop-schemas
    nss
    nspr
    dbus
    at-spi2-atk
    cups
    cairo
    pango
    atk
    libdrm
    mesa
    libxkbcommon
    alsa-lib
    expat
    libnotify
    libsecret
    libappindicator-gtk3
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
    xorg.libxcb
    xorg.libXtst
  ];

  unpackPhase = ''
    runHook preUnpack
    dpkg-deb -x $src .
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt
    cp -r opt/Tabby $out/opt/

    mkdir -p $out/share
    cp -r usr/share/applications $out/share/
    cp -r usr/share/icons $out/share/

    # Create launcher
    mkdir -p $out/bin
    ln -s $out/opt/Tabby/tabby $out/bin/tabby

    runHook postInstall
  '';

  postInstall = ''
    rm -f $out/opt/Tabby/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.musl.node
    substituteInPlace $out/share/applications/tabby.desktop --replace "/opt/Tabby/tabby" "$out/bin/tabby"
  '';

  postFixup = ''
    wrapProgram $out/bin/tabby \
      --prefix LD_LIBRARY_PATH : ${
        pkgs.lib.makeLibraryPath [
          pkgs.mesa
          pkgs.libglvnd
        ]
      }
  '';

  meta = with pkgs.lib; {
    description = "A terminal for a modern age";
    homepage = "https://github.com/Eugeny/tabby#readme";
    license = licenses.mit;
    maintainers = [ maintainers.unlisted ];
    platforms = platforms.linux;
    mainProgram = "tabby";
  };
}
