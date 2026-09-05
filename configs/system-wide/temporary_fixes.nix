{
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "olm-3.2.16" # for libQuotient in neochat. Will be fixed in v0.10
      "electron-39.8.10" # for logseq. Will be fixed in v2
      "electron-40.10.5"
    ];
  };
}
