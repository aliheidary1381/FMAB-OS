{
  config,
  pkgs,
  ...
}:

let
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
      # qrca was not available
      qtlanguageserver
      ktorrent
      # francis
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
    qalculate-qt
    google-chrome
    cloudflare-warp
    telegram-desktop
    motrix
    dopamine # what's wrong with KDE's built-in Elisa?
    onlyoffice-desktopeditors
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
    jre25_minimal
    raylib-games
  ];
  expert = with pkgs; [
    logseq
    libreoffice-qt
    gimp3-with-plugins
    inkscape-with-extensions
    inkscape-extensions.textext
    media-downloader
    winboat
    libguestfs-with-appliance
    screenkey
    # Add subtitlecomposer for subtitle editing, kdePackages.kdenlive for video editing, and davinci-resolve-studio for more advanced editing
    # Add blender-hip for 3D graphics
  ];
  ai = with pkgs; [
    jan
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
    imagemagick
    ffmpeg-full
    tldr
  ];
  music = with pkgs; [
    streamrip
    config.ali.packages.lyrics-finder
    kid3
    puddletag
    ocenaudio
    mediainfo-gui
    mkvtoolnix
    makemkv
    config.ali.packages.dvdae
    sacd
  ];
  edutation = with pkgs.kdePackages; [
    kwordquiz
    minuet
    kmplot
    kig
    kturtle
    rocs
    kalgebra
    step
    kalzium
    kgeography
  ];
  academia = with pkgs; [
    sioyek # toggle_smooth_scroll_mode & auto toggle_dark_mode
    # kdePackages.Karp ?
    zotero
    # jabref
    ghostscript
    texliveFull
    texlivePackages.svg-inkscape
    texlab
    kile
    labplot
    config.ali.packages.R
    (writeShellScriptBin "r-languageserver" ''
      exec R --slave -e 'languageserver::run()'
    '')
    (kdePackages.cantor.overrideAttrs (old: {
      buildInputs = (old.buildInputs or [ ]) ++ [
        config.ali.packages.python
      ];
    }))
    # kdePackages.RKWard ?
    # positron-bin
    # sage
    # mathematica
  ];
  coding = with pkgs; [
    # luajit
    # julia
    grpc
    protobuf
    bruno
    openssl
    heaptrack
    sqlc
    kdePackages.kcachegrind
    config.ali.jetbrains.datagrip
    # Add kexi for database management
    sqls
    yaml-language-server
    package-version-server
    taplo
    marksman
    # kdePackages.Licentia ?
    # kdePackages.KRegexpEditor ?
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
    config.ali.jetbrains.pycharm
    config.ali.jetbrains.dataspell
    (pkgs.writeShellScriptBin "dataspell-with-jupyter-notebook" ''
      jupyter notebook & dataspell; pkill -f "jupyter-notebook"
    '')
    pyright
    basedpyright
    ruff
    pyrefly
    config.ali.packages.python
  ]; # uv & pkgs.python313Packages.pip is also ditched
  javascript = with pkgs; [
    nodejs-slim_24 # = nodejs with no npm
    (pnpm.overrideAttrs (oldAttrs: {
      withNode = false;
    }))
    deno
    config.ali.jetbrains.webstorm
    typescript
    vscode-langservers-extracted
    typescript-language-server
    biome
    eslint
    vtsls
    tailwindcss-language-server
  ]; # pkgs.corepack & pkgs.fnm are also ditched
  goPkgs = with pkgs; [
    go
    gopls
    config.ali.jetbrains.goland
  ];
  rust = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    config.ali.jetbrains.rustrover
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
    config.ali.jetbrains.clion
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
    GOPATH = "/home/ali/.local/share/go";
    GOMODCACHE = "/home/ali/.local/share/go/pkg/mod";
  };
  programs.firejail.enable = true;
  programs.mtr.enable = true;
  services.rtorrent = {
    enable = true;
    package = config.ali.packages.rtorrent;
    configText = pkgs.lib.mkAfter ''
      schedule = scgi_permission,0,0,"execute.nothrow=chmod,\"g+rw,o=\",(cfg.rpcsock)"
      system.file.allocate=1
      system.file.allocate.set=1
      network.http.proxy_address = "socks5h://192.168.122.66:18888"
      network.http.proxy_address.set = "socks5h://192.168.122.66:18888"
    '';
  };
  services.flood.enable = true;
  systemd.services.flood.serviceConfig.SupplementaryGroups = [ "rtorrent" ];
  services.stirling-pdf.enable = true;
  services.cloudflare-warp.enable = true;
  services.v2raya.enable = true;
  services.v2raya.cliPackage = pkgs.xray;
  services.sing-box.enable = true;

  services.ollama.enable = true;
  services.ollama.loadModels = [
    "gemma3n:e2b-it-q4_K_M"
    "qwen3:4b-instruct-2507-q4_K_M"
    "qwen3:4b-thinking-2507-q4_K_M"
    "qwen3-embedding:0.6b-q8_0"
  ]; # "qwen3-coder:30b-a3b-q4_K_M" "qwen3-vl:2b-instruct-q4_K_M" "qwen3-vl:2b-thinking-q4_K_M"

  security.wrappers = config.ali.security.dvdae;

  xdg.mime.defaultApplications = {
    # ~/.config/mimeapps.list
    "application/epub+zip" = "org.kde.okular.desktop";
    "application/json" = "dev.zed.Zed.desktop";
    "application/pdf" = "org.kde.okular.desktop";
    "application/vnd.oasis.opendocument.presentation" = "impress.desktop";
    "application/vnd.oasis.opendocument.spreadsheet" = "calc.desktop";
    "application/vnd.oasis.opendocument.text" = "writer.desktop";
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
      "onlyoffice-desktopeditors.desktop";
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" =
      "onlyoffice-desktopeditors.desktop";
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
      "onlyoffice-desktopeditors.desktop";
    "application/vnd.pg.format" = "dev.zed.Zed.desktop";
    "application/vnd.rar" = "org.kde.ark.desktop";
    "application/vnd.sqlite3" = "base.desktop";
    "application/x-7z-compressed" = "org.kde.ark.desktop";
    "application/x-bittorrent" = "chrome-nhadonnpnhmghdaakodelnkkljdempbk-Default.desktop";
    "application/x-bzip" = "org.kde.ark.desktop";
    "application/x-bzip2" = "org.kde.ark.desktop";
    "application/x-debian-package" = "org.kde.ark.desktop";
    "application/x-gzip" = "org.kde.ark.desktop";
    # "application/x-ms-application" = ;
    "application/x-rar-compressed" = "org.kde.ark.desktop";
    "application/x-shellscript" = "dev.zed.Zed.desktop";
    "application/x-tar" = "org.kde.ark.desktop";
    "application/x-tex" = "org.kde.kile.desktop";
    "application/x-zip-compressed" = "org.kde.ark.desktop";
    "application/yaml" = "dev.zed.Zed.desktop";
    "application/zip" = "org.kde.ark.desktop";
    "application/zip-compressed" = "org.kde.ark.desktop";
    "audio/flac" = "dopamine.desktop";
    "audio/mpeg" = "dopamine.desktop";
    # "font/otf" = ; # Where's KFontview?
    "image/jpeg" = "org.kde.gwenview.desktop";
    "image/png" = "org.kde.gwenview.desktop";
    "image/svg+xml" = "org.kde.gwenview.desktop";
    "image/webp" = "org.kde.gwenview.desktop";
    "text/css" = "dev.zed.Zed.desktop";
    "text/csv" = "dev.zed.Zed.desktop";
    "text/html" = "dev.zed.Zed.desktop";
    "text/javascript" = "dev.zed.Zed.desktop";
    "text/markdown" = "dev.zed.Zed.desktop";
    "text/plain" = "dev.zed.Zed.desktop";
    "text/tab-separated-values" = "dev.zed.Zed.desktop";
    "text/x-c" = "dev.zed.Zed.desktop";
    "text/x-python" = "dev.zed.Zed.desktop";
    "video/mp4" = "org.kde.haruna.desktop";
    "video/x-matroska" = "org.kde.haruna.desktop";
  };
  xdg.mime.addedAssociations = {
    "application/epub+zip" = "org.kde.okular.desktop";
    "application/json" = "dev.zed.Zed.desktop";
    "application/pdf" = "org.kde.okular.desktop";
    "application/vnd.oasis.opendocument.presentation" = "impress.desktop";
    "application/vnd.oasis.opendocument.spreadsheet" = "calc.desktop";
    "application/vnd.oasis.opendocument.text" = "writer.desktop";
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
      "onlyoffice-desktopeditors.desktop";
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" =
      "onlyoffice-desktopeditors.desktop";
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
      "onlyoffice-desktopeditors.desktop";
    "application/vnd.pg.format" = [
      "dev.zed.Zed.desktop"
      "mediainfo-gui.desktop"
      # subtitlecomposer
    ];
    "application/vnd.rar" = "org.kde.ark.desktop";
    "application/vnd.sqlite3" = [
      "base.desktop"
      "dev.zed.Zed.desktop"
    ];
    "application/x-7z-compressed" = "org.kde.ark.desktop";
    "application/x-bittorrent" = "chrome-nhadonnpnhmghdaakodelnkkljdempbk-Default.desktop";
    "application/x-bzip" = "org.kde.ark.desktop";
    "application/x-bzip2" = "org.kde.ark.desktop";
    "application/x-debian-package" = "org.kde.ark.desktop";
    "application/x-gzip" = "org.kde.ark.desktop";
    # "application/x-ms-application" = ;
    "application/x-rar-compressed" = "org.kde.ark.desktop";
    "application/x-shellscript" = "dev.zed.Zed.desktop";
    "application/x-tar" = "org.kde.ark.desktop";
    "application/x-tex" = [
      "org.kde.kile.desktop"
      "dev.zed.Zed.desktop"
    ];
    "application/x-zip-compressed" = "org.kde.ark.desktop";
    "application/yaml" = "dev.zed.Zed.desktop";
    "application/zip" = "org.kde.ark.desktop";
    "application/zip-compressed" = "org.kde.ark.desktop";
    "audio/flac" = [
      "dopamine.desktop"
      "mediainfo-gui.desktop"
    ];
    "audio/mpeg" = [
      "dopamine.desktop"
      "mediainfo-gui.desktop"
    ];
    # "font/otf" = ; # Where's KFontview?
    "image/jpeg" = [
      "org.kde.gwenview.desktop"
      "org.kde.krita.desktop"
      "org.kde.kolourpaint.desktop"
      "gimp.desktop"
      "mediainfo-gui.desktop"
    ];
    "image/png" = [
      "org.kde.gwenview.desktop"
      "org.kde.krita.desktop"
      "org.kde.kolourpaint.desktop"
      "gimp.desktop"
      "mediainfo-gui.desktop"
    ];
    "image/svg+xml" = [
      "org.kde.gwenview.desktop"
      "google-chrome.desktop"
      "org.inkscape.Inkscape.desktop"
      "mediainfo-gui.desktop"
    ];
    "image/webp" = [
      "org.kde.gwenview.desktop"
      "org.kde.krita.desktop"
      "org.kde.kolourpaint.desktop"
      "gimp.desktop"
      "mediainfo-gui.desktop"
    ];
    "text/css" = "dev.zed.Zed.desktop";
    "text/csv" = "dev.zed.Zed.desktop";
    "text/html" = [
      "dev.zed.Zed.desktop"
      "google-chrome.desktop"
    ];
    "text/javascript" = "dev.zed.Zed.desktop";
    "text/markdown" = "dev.zed.Zed.desktop";
    "text/plain" = "dev.zed.Zed.desktop";
    "text/tab-separated-values" = "dev.zed.Zed.desktop";
    "text/x-c" = "dev.zed.Zed.desktop";
    "text/x-python" = "dev.zed.Zed.desktop";
    "video/mp4" = [
      "org.kde.haruna.desktop"
      "mediainfo-gui.desktop"
    ];
    "video/x-matroska" = [
      "org.kde.haruna.desktop"
      "mediainfo-gui.desktop"
    ];
  };
}
