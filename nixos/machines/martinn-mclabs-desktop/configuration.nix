{
  networking.hostId = "017a0afa";
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

  users.users.petar = {
    isNormalUser = true;
    description = "Petar Kirov";
    extraGroups = ["metacraft" "wheel"];
    hashedPassword = "$y$j9T$8OwPpcEsrFWgnlqXXauT20$ARli4epWQD8toCWHKsUbtqfje/dymlL4jJSX6ZPL./8";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAA21K6QsD/0pHbagErkHsl54bqKirKShJCsHSypG/V8 mcl-desktop1"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEbtxe6JCcKV+TWiojOVqp2qdf2dLyKQp85p3rcNekk+ zlx@zlx-flow-x13"
    ];
  };

  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "56374ac9a4d1532e"
    ];
  };
}
