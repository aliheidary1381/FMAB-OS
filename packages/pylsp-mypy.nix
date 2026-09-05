{
	pkgs, ...
}:

pkgs.python314Packages.buildPythonPackage (finalAttrs: {
  pname = "pylsp-mypy";
  version = "0.8.0";
  pyproject = true;

  src = pkgs.fetchPypi {
    pname = "pylsp_mypy";
    inherit (finalAttrs) version;
    hash = "sha256-ANhur6TlRO6Bpzl57/GpmPvUDUrpwYIf6IAjMmp1bcI=";
  };

  build-system = [ pkgs.python314Packages.setuptools ];

  dependencies = [
    pkgs.python314Packages.mypy
    pkgs.python314Packages.python-lsp-server
  ];

  nativeCheckInputs = [ pkgs.python314Packages.pytestCheckHook ];

  pythonImportsCheck = [ "pylsp_mypy" ];

  disabledTests = [
    # Tests wants to call dmypy
    "test_option_overrides_dmypy"
  ];
})
