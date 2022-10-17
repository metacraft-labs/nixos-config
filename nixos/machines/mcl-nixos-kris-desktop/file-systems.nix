with builtins; let
  zfsRoot = "zfs_root";
  splitPath = path: filter (x: (typeOf x) == "string") (split "/" path);
  pathTail = path: concatStringsSep "/" (tail (splitPath path));
  makeZfs = zfsDataset: {
    name = "/" + pathTail zfsDataset;
    value = {
      device = "${zfsRoot}/${zfsDataset}";
      fsType = "zfs";
      options = ["zfsutil"];
    };
  };
  zfsFileSystems = datasetList: listToAttrs (map makeZfs datasetList);
in {
  fileSystems =
    {
      "/boot" = {
        device = "/dev/disk/by-partuuid/0ae0400a-a264-4587-ac59-399e6ca4af9b";
        fsType = "vfat";
      };
    }
    // zfsFileSystems [
      "nixos"
      "nixos/nix"
      "nixos/var"
      "nixos/var/lib"
      "nixos/var/lib/docker"
      "userdata/home"
    ];

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/dc6f553d-55be-4c78-a953-cdb7ec5f072b";
      randomEncryption = true;
    }
  ];
}
