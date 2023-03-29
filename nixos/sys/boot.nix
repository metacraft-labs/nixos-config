{
  config,
  pkgs,
  lib,
  ...
}: {
  boot.kernelPackages = lib.mkDefault config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.kernel.sysctl."kernel.perf_event_paranoid" = 1;
  boot.supportedFilesystems = ["zfs"];
  boot.zfs.forceImportRoot = false;

  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Reference:
  # * https://wiki.archlinux.org/index.php/Linux_console
  # * https://alexandre.deverteuil.net/docs/archlinux-consolefonts/
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=15s
  '';
}
