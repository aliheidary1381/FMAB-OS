{ pkgs, ... }:
{
  pythonForJupyter = (
    (pkgs.python313.override {
      packageOverrides = self: super: {
        ipykernel = super.ipykernel.overrideAttrs (old: {
          postInstall = ''
            mkdir -p $out/share/jupyter/kernels/ir
            cp -r ${pkgs.rPackages.IRkernel}/library/IRkernel/kernelspec/* $out/share/jupyter/kernels/ir/
          '';
        });
        torch = super.torch.override {
          vulkanSupport = true;
          buildDocs = true;
        };
      };
    }).withPackages
      (
        # ps is python313Packages
        ps: with ps; [
          tqdm
          httpx
          socksio

          numpy
          scipy
          pandas
          pyarrow
          jupyterlab
          jupyterlab-widgets
          # jupyterlab-execute-time
          notebook
          ipywidgets
          xgboost
          scikit-learn
          scikit-image
          keras # depends on tf # to do
          wandb
          torch
          torchsummary
          torchvision
          torch-geometric
          opencv4
          pillow
          tf-keras
          transformers
          accelerate
          datasets
          evaluate
          peft
          networkx

          matplotlib
          seaborn
          # hvplot
          # plotly
          # dash
          # streamlit
          # dask
          rdkit
          monai
          # gensim # to do
          seqeval
          kagglehub
          # gymnasium
        ]
      )
  );
  python = (pkgs.python314.withPackages (ps: with ps; [
    python-lsp-server
    python-lsp-ruff
    pylsp-mypy
    black
    brotli
  ]));
  R = (
    pkgs.rWrapper.override {
      packages = with pkgs.rPackages; [
        IRkernel
        languageserver
        # package mirror: https://cran.um.ac.ir/
      ];
    }
  );
}
