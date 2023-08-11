{lib, ...}: {
  imports = [./file-systems.nix];

  nixpkgs.hostPlatform = "x86_64-linux";

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.kernelParams = ["i915.force_probe=4680"];
  boot.extraModulePackages = [];

  powerManagement.cpuFreqGovernor = "performance";

  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;
}
