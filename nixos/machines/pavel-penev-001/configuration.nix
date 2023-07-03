{
  networking.hostId = "b3f4e906";
  system.stateVersion = "23.05";

  services.zfs = {
    trim.enable = true;
    autoScrub.enable = true;
    autoScrub.pools = ["zfs_root"];
  };
}
