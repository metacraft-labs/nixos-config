let
  inherit (import ../lib.nix) zfsFileSystems;
in {
  services.zfs = {
    trim.enable = true;
    autoScrub.enable = true;
    autoScrub.pools = ["rpool"];
  };

  fileSystems =
    {
      "/boot" = {
        device = "/dev/disk/by-partuuid/3ee6b580-bca1-411e-8919-c3557ccde191";
        fsType = "vfat";
      };
    }
    // (zfsFileSystems {
      zfsRoot = "rpool";
      datasets = [
        # "lxd"
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
      device = "/dev/disk/by-partuuid/bea8dbbf-95af-45ee-ba33-64a9835120c7";
      randomEncryption = true;
    }
  ];
}
