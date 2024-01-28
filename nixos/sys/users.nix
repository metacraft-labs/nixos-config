{
  pkgs,
  defaultUser,
  ...
}: {
  # Ensure the plugdev group exists, so it could be used for udev rules
  users.groups.plugdev = {};
  security.sudo.wheelNeedsPassword = false;

  users.users."${defaultUser}" = {
    shell = pkgs.fish;
    initialPassword = "";
    isNormalUser = true;
    extraGroups = ["wheel" "lxd" "podman" "docker" "plugdev" "libvirtd"];
  };
}
