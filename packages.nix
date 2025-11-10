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
      filelight
      partitionmanager
      isoimagewriter
      kfind
      ksystemlog
      kompare
      kolourpaint
      kcolorchooser
      kcharselect
      # qrca
      qtlanguageserver
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
  ai = with pkgs; [
    mcp-nixos
    github-mcp-server
    # mcp-k8s-go
    # mcp-grafana
    # playwright-mcp
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
    lsd
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
    (rWrapper.override {
      packages = with rPackages; [
        IRkernel
        languageserver
      ];
    })
    (pkgs.writeShellScriptBin "r-languageserver" ''
      exec R --slave -e 'languageserver::run()'
    '')
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
    # (pkgs.writeShellScriptBin "dataspell-with-jupyter-notebook" ''
    #   jupyter notebook & dataspell; pkill -f "jupyter-notebook"
    # '')
    pyright
    basedpyright
    ruff
    (
      (python313.override {
        packageOverrides = self: super: {
          ipykernel = super.ipykernel.overrideAttrs (old: {
            postInstall = ''
              mkdir -p $out/share/jupyter/kernels/ir
              cp -r ${rPackages.IRkernel}/library/IRkernel/kernelspec/* $out/share/jupyter/kernels/ir/
            '';
          });
        };
      }).withPackages
      (
        # ps is python313Packages
        ps: with ps; [
          python-lsp-server
          python-lsp-ruff
          pylsp-mypy
          tqdm
          numpy
          scipy
          pandas
          pyarrow
          jupyterlab
          notebook
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
          pillow
          pydicom
        ]
      )
    )
  ]; # uv & pkgs.python313Packages.pip is also ditched
  javascript = with pkgs; [
    nodejs-slim_24 # = nodejs with no npm
    (pnpm.overrideAttrs (oldAttrs: {
      withNode = false;
    }))
    deno
    # webstorm
    typescript
    vscode-langservers-extracted
    typescript-language-server
    biome
    eslint
    vtsls
    tailwindcss-language-server
  ];
  goPkgs = with pkgs; [
    go
    gopls
    # goland
  ];
  rust = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    # rustrover
    rust-analyzer
  ];
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
    ++ ai
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
  environment.sessionVariables = {
    GOPATH = "/home/ali/.go";
    GOMODCACHE = "/home/ali/.go/pkg/mod";
  };
}
