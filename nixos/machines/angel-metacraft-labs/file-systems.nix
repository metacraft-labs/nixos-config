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
        device = "/dev/disk/by-partuuid/285b7cbb-d50f-4bbc-af4c-644e8e65522d";
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
      device = "/dev/disk/by-partuuid/77c450ab-4dea-4610-8409-b8b621dcc1de";
      randomEncryption = true;
    }
  ];
}
