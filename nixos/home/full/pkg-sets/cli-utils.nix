{pkgs, ...}: {
  home.packages = with pkgs; [
    asciinema
    gh
    sshfs
    tmate
    powertop
    # qrencode
    # w3m
  ];
}
