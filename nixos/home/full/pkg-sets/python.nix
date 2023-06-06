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

          ipython
          jupyter
        ])
    )
  ];
}
