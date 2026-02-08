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
    unzip
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
    pass
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
  platform = with pkgs; [
    runc
    kubectl
    kubernetes-helm
    freelens-bin
    podman
    podman-desktop
    dive
    skopeo
    docker-compose
    minikube
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
    ++ platform
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

  virtualisation.containers.enable = true;
  virtualisation.containers.registries.search = [
    "quay.io"
    "public.ecr.aws"
    "ghcr.io"
    "docker.arvancloud.ir"
    "docker.mobinhost.com"
    "focker.ir"
    "docker.kernel.ir"
  ];
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # For WinBoat Windows containers
    dockerSocket.enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  virtualisation.oci-containers.backend = "podman";
  systemd.targets.machines.enable = true; # For nspawn Linux containers
  virtualisation.waydroid.enable = true; # For WayDroid Android containers https://wiki.nixos.org/wiki/Waydroid https://docs.waydro.id/usage/
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "ali" ];
  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu_kvm;
    qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  };
  virtualisation.spiceUSBRedirection.enable = true;

  programs.gnupg.agent.enable = true;
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
}
