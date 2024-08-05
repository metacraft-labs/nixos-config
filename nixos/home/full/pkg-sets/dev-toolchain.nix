{
  pkgs,
  unstablePkgs,
  ...
}:
# Note:
# Most / all packages listed here are commented out,
# in favor of per project (dev)shell.nix files.
{
  home.packages = with pkgs; [
    ## Build systems:
    # cmake gnumake ninja meson

    ## Debuggers:
    # gdb lldb_13

    ## C/C++ toolchain:
    # GCC9 should have the highest priority
    # (lib.setPrio 30 binutils) (lib.setPrio 20 clang_11) (lib.setPrio 10 gcc10) lld_11

    ## Haskell
    # ghc

    ## Python
    # python3

    ## crypto & network
    # nethogs # monitoring

    ## D toolchain:
    #unstablePkgs.dmd unstablePkgs.dub unstablePkgs.ldc

    ## Monitoring Metrics
    grafana
    prometheus
    prometheus-node-exporter
    grafana-loki
    # promtail # HMS Breaks
    go

    ## DevOps:
    dbeaver
    #cargo

    ## systemPackages ?
    nodejs_20
    rustup
    gcc
    nim
    swagger-codegen
    cmake
    # rustc
    # libgccjit

    # azure-cli
    # docker-compose
    # kubernetes-helm
    # kubectl
    # terraform
    # lens

    # blockchain
    # go-ethereum
  ];
}
