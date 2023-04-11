{
  networking.hostId = "9a3b4d7a";
  system.stateVersion = "22.11";

  services.zfs = {
    trim.enable = true;
    autoScrub.enable = true;
    autoScrub.pools = ["zfs_root"];
  };

  services.xserver.displayManager.gdm.autoSuspend = false;
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
}
