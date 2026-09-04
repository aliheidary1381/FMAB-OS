{
  config,
  pkgs,
  chaotic,
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
    })) # Unfree
    cloudflare-warp
    telegram-desktop
    config.ali.packages.varia # Firelink
    dopamine
    onlyoffice-desktopeditors
    packet
    unrar
    p7zip
    gnumake
    dos2unix
    file
    binutils
    patchelf
    nix-tree
    nixpkgs-review
    gh
    nil
    nixd
    harper
    fishPlugins.autopair
    efibootmgr
    jre25_minimal
    raylib-games
  ];
  pro = with pkgs; [
    kdePackages.neochat # cinny-desktop
    # logseq
    libreoffice-qt
    pdfarranger
    stirling-pdf-desktop
    gimp3-with-plugins
    inkscape-with-extensions
    (bottles.override {
      removeWarningPopup = true;
    }) # faugus-launcher # https://github.com/reakjra/omikuji
    winboat
    libguestfs-with-appliance
    virt-viewer
    screenkey
    scrcpy
    # Add subtitlecomposer for subtitle editing, kdePackages.kdenlive for video editing, and davinci-resolve-studio for more advanced editing
    # Add blender-hip for 3D graphics
  ];
  ai = with pkgs; [
    jan
    # upscayl
    # affine
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
    streamrip # MediaHarbor didn't work for me
    yt-dlp
    kid3
    puddletag
    ocenaudio # Unfree
    mediainfo-gui
    mkvtoolnix
    makemkv # Unfree
    config.ali.packages.dvdae # Unfree
    flacon
    sacd
    lrcget
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
    swi-prolog
    # (kdePackages.cantor.overrideAttrs (old: {
    #   buildInputs = (old.buildInputs or [ ]) ++ [
    #     config.ali.packages.pythonForJupyter
    #   ];
    # }))
    config.ali.packages.cantor # mathematica # sage
    # rkward
    lean4
    leanPackages.mathlib
  ];
  development = with pkgs; [
    # luajit
    # config.ali.packages.julia
    grpc
    protobuf
    bruno
    openssl
    heaptrack
    sqlc
    kdePackages.kcachegrind
    config.ali.jetbrains.datagrip # Unfree
    # Add kexi for database management
    sqls
    yaml-language-server
    tombi
    package-version-server
    taplo
    marksman
    devtoolbox
    # kdePackages.licentia
  ];
  platform = with pkgs; [
    kubectl
    kubernetes-helm
    headlamp
    podman-desktop
    dive
    skopeo
    docker-compose
    minikube
    crun # runc
    # buildah # podman already uses it under the hood
  ];
  ocamlPkgs = with pkgs; [
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
  python = with pkgs; [
    config.ali.jetbrains.pycharm # positron-bin
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
    ++ pro
    ++ ai
    ++ shell_tools
    ++ music
    ++ academia
    ++ development
    ++ platform
    ++ ocamlPkgs
    ++ python
    ++ javascript
    ++ goPkgs
    ++ rust
    ++ c;

  chaotic.nyx.overlay.enable = false;
  chaotic.appmenu-gtk3-module.enable = true;
  nixpkgs.overlays = [
    (final: prev: {
      appmenu-gtk3-module = chaotic.packages.${final.stdenv.hostPlatform.system}.appmenu-gtk3-module;
    })
  ]; # This fixes GTK3 apps warnings

  programs.appimage.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = [
      "kde"
      "gtk"
    ];
  };

  environment.sessionVariables = {
    GOPATH = "/home/ali/.local/share/go";
    GOMODCACHE = "/home/ali/.local/share/go/pkg/mod";
    LEAN_PATH = "${pkgs.leanPackages.mathlib}/.lake/build/lib/lean";
  };

  virtualisation.containers = {
    enable = true;
    containersConf.settings.engine.runtime = "crun";
    registries.settings = {
    	unqualified-search-registries = [
	    "quay.io"
	    "docker.io"
			"pkg.dev"
			"public.ecr.aws"
			"ghcr.io"
			"mcr.microsoft.com"
			"registry.k8s.io"
	  ];
      registry = [
        {
          location = "quay.io";
          mirror = [
            {
              location = "quay.hamdocker.ir";
            }
            {
              location = "mirror-docker.runflare.com";
            }
            {
              location = "quay-mirror.liara.ir";
            }
            {
              location = "docker-quay-mirror.kargadan.ir";
            }
            {
              location = "focker.ir/quay.io";
            }
          ];
        }
        {
          location = "docker.io";
          mirror = [
            {
              location = "mirror.cdn.ir";
            }
            {
              location = "docker.arvancloud.ir";
            }
            {
              location = "docker.mobinhost.com";
            }
            {
              location = "hub.hamdocker.ir";
            }
            {
              location = "docker-mirror.liara.ir";
            }
            {
              location = "docker-mirror.kargadan.ir";
            }
            {
              location = "docker.devneeds.ir";
            }
            {
              location = "mirror-docker.runflare.com";
            }
            {
              location = "focker.ir";
            }
            {
              location = "hub.megan.ir";
            }
            {
              location = "docker.kernel.ir";
            }
            {
              location = "docker.hyperclouds.ir";
            }
            {
              location = "mirrors.pardisco.co";
            }
            {
              location = "docker.chrepo.ir"; # "docker.jamko.ir"
            }
            {
              location = "mirror2.chabokan.net";
            }
            {
              location = "docker.iranserver.com";
            }
            # "repo.iut.ac.ir"
            # "repo.ito.gov.ir"
          ];
        }
        {
          location = "pkg.dev";
          mirror = [
            {
              location = "gcr.hamdocker.ir";
            }
            {
              location = "mirror-docker.runflare.com";
            }
            {
              location = "focker.ir/gcr.io";
            }
          ];
        }
        {
          location = "pkg.dev";
          prefix = "*.gcr.io";
          mirror = [
            {
              location = "gcr.hamdocker.ir";
            }
            {
              location = "mirror-docker.runflare.com";
            }
            {
              location = "focker.ir/gcr.io";
            }
            {
              location = "us.gcr.io";
            }
            {
              location = "gcr.io";
            }
          ];
        }
        {
          location = "public.ecr.aws";
          mirror = [
            {
              location = "elastic.hamdocker.ir";
            }
          ];
        }
        {
          location = "ghcr.io";
          mirror = [
	        {
	          location = "mirror-docker.runflare.com";
	        }
					{
              location = "ghcr-mirror.liara.ir";
            }
					{
              location = "focker.ir/ghcr.io";
            }
          ];
        }
        {
          location = "mcr.microsoft.com";
          mirror = [
            {
              location = "mcr.hamdocker.ir";
            }
            {
              location = "mirror-docker.runflare.com";
            }
            {
              location = "mcr-mirror.liara.ir";
            }
            {
              location = "docker-mcr-mirror.kargadan.ir";
            }
          ];
        }
        {
          location = "registry.k8s.io";
          mirror = [
            {
              location = "mirror-docker.runflare.com";
            }
            {
              location = "k8s-mirror.liara.ir";
            }
            {
              location = "docker-k8s-mirror.kargadan.ir";
            }
            {
              location = "focker.ir/registry.k8s.io";
            }
          ];
        }
      ];
    };
  };
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # For WinBoat Windows containers
    dockerSocket.enable = true;
    defaultNetwork.settings.dns_enabled = true;
    extraRuntimes = [ pkgs.crun ];
  };
  virtualisation.cri-o.enable = true; # includes cri-o & cri-tools
  virtualisation.cri-o.runtime = "crun";
  virtualisation.containerd.enable = false; # using cri-o instead
  # services.kubernetes.kubelet.containerRuntimeEndpoint = "unix:///run/crio/crio.sock";
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
  programs.proxychains.enable = true;
  programs.gnupg.agent.enable = true;
  programs.firejail.enable = true;
  programs.mtr.enable = true;
  programs.bat.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  # programs.fzf.enable = true;
  # programs.git.enable = true;

  systemd.services.jupyter = {
    description = "Jupyter development server";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.bash pkgs.fish ];
    environment = {
      JUPYTER_PATH = "${config.ali.packages.extraJupyterKernels}/share/jupyter";
    };
    serviceConfig = {
      Restart = "always";
      ExecStart = ''
        ${config.ali.packages.pythonForJupyter}/bin/jupyter-notebook \
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
      method.insert = d.down.sequential, value|const, 0
      schedule2 = scgi_permission, 0, 0, "execute.nothrow=chmod,\"g+rw,o=\",(cfg.rpcsock)"
      system.file.allocate.set = 1
    '';
  };
  services.flood.enable = true;
  systemd.services.flood.serviceConfig.SupplementaryGroups = [ "rtorrent" ];
  services.cloudflare-warp.enable = true;
  # services.netbird.enable = true;
  services.v2raya.enable = true;
  services.v2raya.cliPackage = pkgs.xray;
  services.sing-box.enable = true;

  # services.ollama.enable = true;
  # services.ollama.loadModels = [
  #   "qwen3:4b-instruct-2507-q4_K_M"
  #   "qwen3-embedding:0.6b-q8_0"
  #   "qwen3-coder:30b-a3b-q4_K_M"
  # ];

  security.wrappers = config.ali.security.dvdae;
}
