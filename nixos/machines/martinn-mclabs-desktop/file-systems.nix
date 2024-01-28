let
  inherit (import ../lib.nix) zfsFileSystems;
in {
  fileSystems =
    {
      "/boot" = {
        device = "/dev/disk/by-partuuid/388c278a-d8b6-43e7-8815-f76639204846";
        fsType = "vfat";
      };
    }
    // (zfsFileSystems {
      datasets = [
        "nixos"
        "nixos/nix"
        "nixos/var"
        "nixos/var/lib"
        "nixos/var/lib/docker"
        "userdata/home"
      ];
    });

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/b45cfc1d-db80-4005-bfec-809bd4156e54";
      randomEncryption = true;
    }
  ];
}
