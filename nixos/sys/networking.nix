{
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.nameservers = ["1.1.1.1"];

  networking.firewall = {
    trustedInterfaces = ["tailscale0"];
  };

  services = {
    mullvad-vpn.enable = true;
    tailscale.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
