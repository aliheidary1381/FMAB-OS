{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  numpy,
  pandas,
  scikit-learn,
  scikit-image,
  tqdm,
  pillow,
  fire,
  torch,
  torchvision,
}:
buildPythonPackage rec {
  pname = "medmnist";
  version = "3.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-oMsrNxVWEElEW4rW6DdaPfey9KY6t1wuOydxnYOdOsQ=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    numpy
    pandas
    scikit-learn
    scikit-image
    tqdm
    pillow
    fire
    torch
    torchvision
  ];

  meta = {
    description = "Standardized Datasets for 2D and 3D Biomedical Image Classification";
    homepage = "https://medmnist.com/";
    license = lib.licenses.asl20;
  };
}
