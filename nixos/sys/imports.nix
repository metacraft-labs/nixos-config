{
  imports = [
    ./boot.nix
    ./extra_services.nix
    #./gnome_desktop_env.nix
    #./xfcei3_desktop_env.nix
    ./kde_desktop_env.nix
    ./i18n.nix
    ./ledger-nano-udev-rules.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
