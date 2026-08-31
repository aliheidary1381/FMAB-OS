{ pkgs, ... }: rec
{
  julia = pkgs.julia.withPackages [ "IJulia" "GR" "Plots" "PyPlot" "Gadfly" ];
  pythonForJupyter = (
    (pkgs.python313.override {
      packageOverrides = self: super: {
        ipykernel = super.ipykernel.overrideAttrs (old: {
          postInstall = (old.postInstall or "") + ''
            mkdir -p $out/share/jupyter/kernels/ir
            cp -r ${pkgs.rPackages.IRkernel}/library/IRkernel/kernelspec/* $out/share/jupyter/kernels/ir/
            mkdir -p $out/share/jupyter/kernels/julia
            cat <<'EOF' > $out/share/jupyter/kernels/julia/kernel.json
	            {
	                "display_name": "Julia ${julia.version}",
	                "argv": [
	                "${julia}/bin/julia",
	                "-i",
	                "--color=yes",
	                "-e",
	                "import IJulia; IJulia.run_kernel()",
	                "''${connection_file}"
	                ],
	                "language": "julia",
	                "env": {},
	                "interrupt_mode": "signal"
	            }
	            EOF

             cp -f ${julia.projectAndDepot}/depot/packages/IJulia/*/deps/logo-32x32.png $out/share/jupyter/kernels/julia/
             cp -f ${julia.projectAndDepot}/depot/packages/IJulia/*/deps/logo-64x64.png $out/share/jupyter/kernels/julia/
             cp -f ${julia.projectAndDepot}/depot/packages/IJulia/*/deps/logo-svg.svg $out/share/jupyter/kernels/julia/
          '';
        });
        torch = super.torch.override {
          vulkanSupport = true;
          buildDocs = true;
        };
        array-api-compat = super.array-api-compat.overrideAttrs (old: {
          disabledTests = (old.disabledTests or []) ++ [
            "cupy"
            "test_device_to_device"  # The specific test that crashes
          ];
        });
      };
    }).withPackages
      (
        # ps is python313Packages
        ps: with ps; [
          pip # PyCharm needs this to list the installed packages, but it's useless otherwise.
          socksio
          tqdm
          numpy
          scipy
          pandas
          pyarrow
          jupyterlab
          jupyterlab-widgets
          jupyterlab-execute-time
          notebook
          ipywidgets
          xgboost
          scikit-learn
          scikit-image
          keras
          wandb
          torch
          torchsummary
          torch-geometric
          torchvision
          opencv4
          pillow
          tf-keras
          # gensim
          transformers
          accelerate
          datasets
          evaluate
          peft
          seqeval
          gymnasium
          kagglehub
          networkx
          matplotlib
          seaborn
          # plotly
          # altair
          # bokeh
          # pydeck
          # streamlit
          # dash
          # dask
          rdkit
          monai
          imageio
        ]
      )
  );
  python = (pkgs.python314.withPackages (ps: with ps; [
    python-lsp-server
    python-lsp-ruff
    # pylsp-mypy
    black
    brotli
  ]));
  R = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      IRkernel
      languageserver
      ggplot2
      # package mirror: https://cran.um.ac.ir/
    ];
  };
}
