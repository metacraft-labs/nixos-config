
{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.layout = "us,bg";
  services.xserver.xkbVariant = "dvorak,";  
  services.xserver.xkbOptions = "grp:lalt_lshift_toggle,altwin:ctrl_alt_win";

  # Needed for Home Manager to be able to update DConf settings
  # See: https://github.com/nix-community/home-manager/blob/f911ebbec927e8e9b582f2e32e2b35f730074cfc/modules/misc/dconf.nix#L25-L26
  programs.dconf.enable = true;

  hardware.pulseaudio.enable = false;
  # bluez needs pulseaudio CLI tools to be installed
  environment.systemPackages = [pkgs.pulseaudio];

  security.rtkit.enable = true;

  services.blueman.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
}
