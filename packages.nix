{ config, pkgs, ... }:

let
  rtorrent = config.ali.packages.rtorrent;
  lyrics-finder = config.ali.packages.lyrics-finder;
  dvdae = config.ali.packages.dvdae;

  KDE =
    with pkgs.kdePackages;
    [
      plasma-disks
      plasma-firewall
      kaccounts-providers
      kio-gdrive
      plymouth-kcm
      plasma-sdk
      kmix
      partitionmanager
      isoimagewriter
      kfind
      ksystemlog
      kompare
      kolourpaint
      kcolorchooser
      calligra
    ]
    ++ (with pkgs; [
      # systemdgenie
      # elf-dissector
      krita
      haruna
      krename
    ])
    ++ [ config.ali.packages.fmab-customizations ];
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
    (libreoffice.overrideAttrs (oldAttrs: {
      withFonts = true;
      withHelp = false;
      kdeIntegration = true;
      langs = [ "en-GB" ];
    }))
    gimp3-with-plugins
    # Add inkscape-with-extensions & texlivePackages.svg-inkscape & inkscape-extensions.textext for vector graphics
    media-downloader
    rtorrent
    flood
    winboat
    libguestfs-with-appliance
    yt-dlp
    # Add subtitlecomposer for subtitle editing, kdePackages.kdenlive for video editing, and davinci-resolve-studio for more advanced editing
    # Add blender-hip for 3D graphics
  ];
  shell_tools = with pkgs; [
    waveterm # TODO: add tabby also
    wget
    jq
    sl
    cowsay
    cmatrix
    asciiquarium-transparent
    parallel-full
    dig
    tcpdump
    inetutils
    httpie
    gtrash
    broot
    xcp
    fd
    eza
    bat
    lazygit
    fzf
    zoxide
  ];
  music = with pkgs; [
    streamrip
    lyrics-finder
    kid3
    puddletag
    ocenaudio
    mediainfo-gui
    mkvtoolnix
    makemkv
    dvdae
    sacd
    ffmpeg-full
  ];
  academia = with pkgs; [
    stirling-pdf
    texliveFull
    texlab
    jabref # kbibtex
    kile
    R
    rPackages.IRkernel
    kdePackages.cantor
    labplot
    # sage
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
    # datagrip
    # Add kexi for database management
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
    # pycharm
    # dataspell
    pyright
    (python313.buildEnv.override {
      extraLibs = [
        rPackages.IRkernel
      ]
      ++ (with python313Packages; [
        tqdm
        numpy
        scipy
        pandas
        pyarrow
        jupyterlab
        notebook
        nix-kernel
        # ilua
        # gophernotes
        scikit-learn
        keras # depends on tf
        torch
        torchvision
        opencv4
        xgboost
        networkx
        matplotlib
        seaborn
        # hvplot
        # plotly
        # dash
        # streamlit
        # dask
      ]);
    })
  ]; # uv & pkgs.python313Packages.pip is also ditched
  javascript = with pkgs; [
    nodejs_24
    deno
    # webstorm
    typescript
    vscode-langservers-extracted
    typescript-language-server
    biome
    eslint
    vtsls
    tailwindcss-language-server
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
    gcc
    gdb
    glibc
    cmake
    ninja
    libclang
    lldb
    icu
    qtcreator
    # libsForQt5.qt5.qtbase
    # libsForQt5.qt5.qtwebsockets
    # clion
    cmake-language-server
    clang-tools
  ]; # pkgs.vcpkg is also ditched
in
{
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
