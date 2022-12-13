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
        device = "/dev/disk/by-partuuid/a077e796-0b22-43e2-8c96-613d7f828135";
        fsType = "vfat";
      };
    }
    # // {
    #   "/mnt/remote/" = {
    #     device = "dimo@192.168.1.106:/home/dimo/";
    #     fsType = "fuse";
    #     options = [
    #       "noauto"
    #       "comment=systemd.automount"
    #       "ssh_command=${user:
    #         writeScript "ssh_as_${user}" ''
    #           exec ${pkgs.sudo}/bin/sudo -i -u ${user} \
    #             ${pkgs.openssh}/bin/ssh $@
    #         ''}"
    #     ];
    #   };
    # }
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
      device = "/dev/disk/by-partuuid/376b91a2-55c0-4344-99b9-e4e64ce83d1c";
      randomEncryption = true;
    }
  ];
}
