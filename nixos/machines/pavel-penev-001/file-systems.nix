let
  inherit (import ../lib.nix) zfsFileSystems;
in {
  fileSystems =
    {
      "/boot" = {
        device = "/dev/disk/by-partuuid/2a35f28b-26db-4188-a28b-28ff35d5c517";
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
      device = "/dev/disk/by-partuuid/327d4053-f96f-454e-9321-a0da28c2448f";
      randomEncryption = true;
    }
  ];
}
