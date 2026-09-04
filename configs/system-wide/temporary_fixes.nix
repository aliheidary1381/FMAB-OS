{
  ...
}:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "olm-3.2.16" # for libQuotient in neochat. Will be fixed in v0.10
      "electron-40.10.5" # for logseq. Will be fixed in v2
    ];
    # overlays = [
    #   (final: prev: {
    #     pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    #       (python-final: python-prev: {
    #         jupyter-server = python-prev.jupyter-server.overridePythonAttrs (old: {
    #           doCheck = false;
    #         });
    #       })
    #       (python-final: python-prev: {
    #         orbax-checkpoint = python-prev.orbax-checkpoint.overridePythonAttrs (old: {
    #           doCheck = false;
    #         });
    #       })
    #     ];
    #   })
    # ];
  };
}
