{hostname, ...}: {
  networking.hostName = hostname;
  nixpkgs.config.allowUnfree = true;
  imports = [
    (./. + "/${hostname}/configuration.nix")
    (./. + "/${hostname}/hardware-configuration.nix")
    ../sys/imports.nix
  ];
}
