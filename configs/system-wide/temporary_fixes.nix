{
  config,
  pkgs,
  ...
}:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "olm-3.2.16" # for libQuotient in neochat. Will be fixed in v0.10
      "electron-39.8.10" # for logseq. Will be fixed in v2
    ];
    overlays = [
        (self: super: {
          python3Packages = super.python3Packages.override {
            overrides = pself: psuper: {
              patool = psuper.patool.overridePythonAttrs (old: {
                disabledTests = (old.disabledTests or []) ++ [
                  "test_py_tarfile_bz2"
                  "test_py_tarfile_bz2_file"
                  "test_tar_bz2"
                  "test_tar_bz2_file"
                  "test_tar_lzip"
                  "test_tar_lzma"
                  "test_tar_xz"
                  "test_tar_xz_file"
                  "test_tar_lzma"
                  "test_tar_xz"
                  "test_mime_file"
                  "test_mime_file_bzip"
                ];
              });
            };
          };
        })
      ];
  };
}
