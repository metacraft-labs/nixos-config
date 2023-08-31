{
  pkgs,
  unstablePkgs,
  ...
}: {
  home.packages = with pkgs; [
    conda

    (
      python311.withPackages (ps:
        with ps; [
          numpy
          pandas
          scikit-learn
          matplotlib
          scipy

          pip
          ipython
          jupyter
          virtualenv
        ])
    )
  ];
}
