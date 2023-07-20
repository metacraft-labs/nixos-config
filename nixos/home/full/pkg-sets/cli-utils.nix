{pkgs, ...}: {
  home.packages = with pkgs; [
    asciinema
    gh
    sshfs
    tmate
    powertop
    pmutils
    # qrencode
    extundelete
    # w3m
  ];
}
