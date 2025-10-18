{ config, pkgs, ... }:

let
  rtorrent = config.ali.packages.rtorrent;
  lyrics-finder = config.ali.packages.lyrics-finder;
  dvdae = config.ali.packages.dvdae;

  KDE =
    with pkgs.kdePackages;
    [
      partitionmanager
      isoimagewriter
      kfind
      kmix
      ksystemlog
      kompare
      kolourpaint
      kcolorchooser
      calligra # libreoffice-qt
    ]
    ++ (with pkgs; [
      haruna
      krename
      systemdgenie
      elf-dissector
      (catppuccin-kde.override {
        flavour = [ "frappe" ];
        accents = [ "yellow" ];
      })
    ]);
  basic = with pkgs; [
    google-chrome
    cloudflare-warp
    telegram-desktop
    motrix
    dopamine # what's wrong with KDE's built-in Elisa?
    unrar
    gnumake
    dos2unix
    file
    binutils
    patchelf
    nixpkgs-review
    nil
    nixd
    harper
    fishPlugins.autopair
    efibootmgr
  ];
  expert = with pkgs; [
    krita # gimp3-with-plugins
    rtorrent
    flood
    libguestfs-with-appliance
    # Add Subtitle Composer & Kdenlive for subtitle & video editing, Krita & Karbon for raster and vector image editing, and KEXI for database management
  ];
  shell_tools = with pkgs; [
    waveterm
    wget
    jq
    sl
    cowsay
    parallel-full
    dig
    tcpdump
    inetutils
    fd
    httpie
  ];
  music = with pkgs; [
    streamrip
    lyrics-finder
    kid3
    puddletag
    ocenaudio
    mediainfo
    mkvtoolnix
    makemkv
    dvdae
    sacd
    ffmpeg-full
  ];
  academia = with pkgs; [
    jabref
    texlab
    R
    kdePackages.cantor
    labplot
    # positron-bin
  ];
  coding = with pkgs; [
    grpc
    protobuf
    postman
    openssl
    heaptrack
    sqlc
    kdePackages.kcachegrind
    datagrip
    sqls
    yaml-language-server
    package-version-server
    taplo
    marksman
  ];
  ocamlPkgs =
    with pkgs;
    [
      ocaml
      dune_3
    ]
    ++ (with pkgs.ocamlPackages; [
      odoc
      utop
      merlin
      ocaml-lsp
      ocamlformat
    ]); # pkgs.opam is ditched in favour of nix
  prolog = with pkgs; [ swi-prolog ];
  python = with pkgs; [
    python313FreeThreading
    # pycharm
    # dataspell
    pyright
  ]; # uv & pkgs.python313Packages.pip is also ditched
  javascript = with pkgs; [
    nodejs_24
    deno
    # webstorm
    typescript
    vscode-langservers-extracted
    typescript-language-server
    biome
  ]; # pkgs.pnpm is also ditched
  goPkgs = with pkgs; [
    go
    gopls
    # goland
  ];
  rust = with pkgs; [
    rustc
    rustfmt
    clippy
    # rustrover
    rust-analyzer
  ]; # pkgs.cargo is also ditched
  c = with pkgs; [
    libgcc
    glibc
    cmake
    gcc
    gdb
    ninja
    libclang
    lldb_21
    icu
    qtcreator
    # qt5.full
    # clion
    cmake-language-server
    clang-tools
  ]; # pkgs.vcpkg is also ditched
  # todo: gcc15 clang_21 llvmPackages_21.libcxxClang llvmPackages_21.clang-unwrapped
in
{
  # nixpkgs.config.permittedInsecurePackages = [ "qtwebengine-5.15.19" ];

  # List packages installed in system profile. To search, run:
  # $ nix search
  environment.systemPackages =
    KDE
    ++ basic
    ++ expert
    ++ shell_tools
    ++ music
    ++ academia
    ++ coding
    ++ ocamlPkgs
    ++ prolog
    ++ python
    ++ javascript
    ++ goPkgs
    ++ rust
    ++ c;
}
