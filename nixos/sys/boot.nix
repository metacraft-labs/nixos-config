{
  config,
  pkgs,
  ...
}: {
  boot.kernelPackages = pkgs.lib.mkOverride 1 config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.kernel.sysctl."kernel.perf_event_paranoid" = 1;
  boot.supportedFilesystems = ["zfs"];
  boot.zfs.forceImportRoot = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "amdgpu.sg_display=0"
  ];
  # boot.kernelParams = [
  #   "video=card0-eDP-1:1920x1200@60"
  #   "video=card0-HDMI-A-1:3840x2160@60"
  # ];

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
