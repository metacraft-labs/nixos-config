{
  pkgs,
  unstablePkgs,
  ...
}:
# Note:
# Most / all packages listed here are commented out,
# in favor of per project (dev)shell.nix files.
{
  programs.git.lfs.enable = true;

  home.packages = with pkgs; [
    # cargo
    # rust-analyzer
    # rls
    # rustc
    # cargo-fmt
    # rust-gdbgui
    # rustdoc
    # rustup
    # cargo-miri
    # rustfmt
    # cargo-clippy
    # clippy-driver
    # rust-gdb
    # rust-lldb
    rustup
    clang
    nodejs
    yarn
    wabt
    go
    pipenv
    sage
    nim
    julia
    just
    tmux
    prometheus
    lsof
    python39
    gnumake
    libgccjit
    nodePackages.node-gyp-build
    redis
    # llvm.clang
    # gcc
    nlohmann_json
    meson
    iredis
    pkg-config
    openssl
    howard-hinnant-date
    rapidjson
    cpulimit
    prometheus

    ## Build systems:
    # cmake gnumake ninja meson

    ## Debuggers:
    gdb
    lldb_13

    ## C/C++ toolchain:
    # GCC9 should have the highest priority
    # (lib.setPrio 30 binutils) (lib.setPrio 20 clang_11) (lib.setPrio 10 gcc10) lld_11
    gmp
    nasm
    libsodium
    # llvmPackages_13.clang

    ## Haskell
    # ghc

    ## Python
    # python3

    ## crypto & network
    # nethogs # monitoring

    ## D toolchain:
    #unstablePkgs.dmd unstablePkgs.dub unstablePkgs.ldc

    ## DevOps:
    dbeaver
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
