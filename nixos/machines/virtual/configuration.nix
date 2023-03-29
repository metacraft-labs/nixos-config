{
  pkgs,
  modulesPath,
  lib,
  ...
}: {
  networking.hostId = "f34e8d14";
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

  imports = [(modulesPath + "/installer/virtualbox-demo.nix")];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;

  # Let demo build as a trusted user.
  nix.settings.trusted-users = ["demo"];

  # Mount a VirtualBox shared folder.
  # This is configurable in the VirtualBox menu at
  # Machine / Settings / Shared Folders.
  # fileSystems."/mnt/monyarm" = {
  #   fsType = "vboxsf";
  #   device = "monyarm";
  #   options = [ "rw" ];
  #};

  users.users.demo = {
    extraGroups = ["vboxsf"];
  };
}
