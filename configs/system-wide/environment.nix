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
      qrca
      ktorrent
      francis
      qtlanguageserver
      qtdeclarative
    ]
    ++ (with pkgs; [
      systemdgenie
      elf-dissector
      krita
      haruna
      krename
    ])
    ++ [ config.ali.packages.fmab-customizations ];
  niri = with pkgs; [
    noctalia-shell
    lxqt.pavucontrol-qt
  ];
  basic = with pkgs; [
    home-manager
    qalculate-qt
    (google-chrome.overrideAttrs (oldAttrs: {
      plasmaSupport = true;
    }))
    cloudflare-warp
    telegram-desktop
    varia
    dopamine # what's wrong with KDE's built-in Elisa?
    onlyoffice-desktopeditors
    packet
    unrar
    p7zip
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
    kdePackages.neochat # Note: Insecure. Should use cinny-desktop instead.
    logseq
    libreoffice-qt
    stirling-pdf-desktop
    gimp3-with-plugins
    inkscape-with-extensions
    winboat
    libguestfs-with-appliance
    virt-viewer
    screenkey
    # Add subtitlecomposer for subtitle editing, kdePackages.kdenlive for video editing, and davinci-resolve-studio for more advanced editing
    # Add blender-hip for 3D graphics
  ];
  ai = with pkgs; [
    jan
    # upscayl
    # mcp-nixos
    github-mcp-server
    mcp-k8s-go
    # mcp-grafana
    # playwright-mcp
  ];
  shell_tools = with pkgs; [
    waveterm
    config.ali.packages.tabby-terminal
    wget
    unzip
    iptables
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
    yt-dlp
    config.ali.packages.lyrics-finder
    kid3
    puddletag
    # ocenaudio # TODO
    mediainfo-gui
    mkvtoolnix
    makemkv
    config.ali.packages.dvdae
    config.ali.packages.flacon
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
    zotero
    jabref
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
        config.ali.packages.pythonForJupyter
      ];
    }))
    # kdePackages.rkward
    # positron-bin
    # sage
    # mathematica
  ];
  development = with pkgs; [
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
    tombi
    package-version-server
    taplo
    marksman
    devtoolbox
    # kdePackages.licentia
    # kdePackages.kregexpeditor
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
    pyright
    basedpyright
    ruff
    pyrefly
    config.ali.packages.python
  ]; # uv & pkgs.python313Packages.pip is also ditched
  javascript = with pkgs; [
    nodejs-slim_24 # = nodejs with no npm & no corepack
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
    crates-lsp
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
  environment.systemPackages =
    KDE
    ++ niri
    ++ basic
    ++ expert
    ++ ai
    ++ shell_tools
    ++ music
    ++ academia
    ++ development
    ++ platform
    ++ ocamlPkgs
    ++ prolog
    ++ python
    ++ javascript
    ++ goPkgs
    ++ rust
    ++ c;

  programs.appimage.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [
      "kde"
      "gtk"
    ];
  };

  environment.sessionVariables = {
    GOPATH = "/home/ali/.local/share/go";
    GOMODCACHE = "/home/ali/.local/share/go/pkg/mod";
  };

  programs.proxychains = {
    enable = true;
    proxies.windscribe = {
      type = "socks5";
      host = "192.168.122.66";
      port = 18888;
      enable = true;
    };
    proxies.phone = {
      type = "socks5";
      host = "10.119.117.156";
      port = 1080;
      enable = false;
    };
  };

  virtualisation.containers.enable = true;
  virtualisation.containers.registries.search = [
    "quay.io"
    "public.ecr.aws"
    "ghcr.io"
    "mirror.cdn.ir"
    "docker.arvancloud.ir"
    "docker.mobinhost.com"
    "hub.hamdocker.ir"
    "mirror-docker.runflare.com"
    "docker.devneeds.ir"
    "focker.ir"
    "docker.kernel.ir"
    "hub.megan.ir"
    "docker.hyperclouds.ir"
    "mirrors.pardisco.co"
    "docker-mirror.liara.ir"
    "docker-mirror.kargadan.ir"
    "docker.iranserver.com"
    "docker.jamko.ir"
    "mirror2.chabokan.net"
    # "repo.iut.ac.ir"
    # "repo.ito.gov.ir"
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

  # programs.bcc.enable = true;
  programs.gnupg.agent.enable = true;
  programs.firejail.enable = true;
  programs.mtr.enable = true;
  programs.bat.enable = true;
  # programs.fzf.enable = true;
  # programs.git.enable = true;

  systemd.services.jupyter = {
    description = "Jupyter development server";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.bash pkgs.fish ];
    serviceConfig = {
      Restart = "always";
      ExecStart = ''
        ${config.ali.packages.pythonForJupyter}/bin/jupyter-notebook \
                    --no-browser --ip=localhost --port=8888 --port-retries 0 \
                    --notebook-dir=~/Codes/DataSpellProjects \
                    --JupyterApp.config_file=${./jupyter_notebook.py}
      '';
      User = "ali";
      Group = "users";
      WorkingDirectory = "~";
    };
  };
  services.rtorrent = {
    enable = true;
    configText = pkgs.lib.mkAfter ''
      method.insert=d.down.sequential,value|const,0
      method.insert.set=d.down.sequential,value|const,0
      schedule = scgi_permission,0,0,"execute.nothrow=chmod,\"g+rw,o=\",(cfg.rpcsock)"
      system.file.allocate=1
      system.file.allocate.set=1
      network.http.proxy_address = "socks5h://192.168.122.66:18888"
      network.http.proxy_address.set = "socks5h://192.168.122.66:18888"
    '';
  };
  services.flood.enable = true;
  systemd.services.flood.serviceConfig.SupplementaryGroups = [ "rtorrent" ];
  services.cloudflare-warp.enable = true;
  # services.netbird.enable = true;
  services.v2raya.enable = true;
  services.v2raya.cliPackage = pkgs.xray;
  services.sing-box.enable = true;

  services.ollama.enable = true;
  services.ollama.loadModels = [
    "qwen3:4b-instruct-2507-q4_K_M"
    "qwen3-embedding:0.6b-q8_0"
    # "qwen3-coder:30b-a3b-q4_K_M"
  ];

  security.wrappers = config.ali.security.dvdae;
}
