{
  config,
  pkgs,
  ...
}: {
  networking.hostId = "3d75aa2f";
  system.stateVersion = "23.11";

  services.udev.packages = [pkgs.yubikey-personalization];
  hardware.openrazer.enable = true;

  # Enable the ZeroTier VPN solution
  # services.zerotierone.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
