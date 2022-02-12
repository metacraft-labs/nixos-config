{ config, pkgs, unstablePkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  manual.manpages.enable = false;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "discord-ptb"
    "google-chrome"
    "postman"
    "slack"
    "spotify-unwrapped"
    "spotify"
    "teams"
    "teamviewer"
    "unrar"
    "zoom"
  ];

  home.packages = [ ]
  ++ (import ./pkg-sets/system-utils.nix { inherit pkgs; })
  ++ (import ./pkg-sets/cli-utils.nix { inherit pkgs; })
  ++ (import ./pkg-sets/dev-toolchain.nix { inherit pkgs unstablePkgs; })
  ++ (import ./pkg-sets/gui.nix { inherit pkgs unstablePkgs; })
  ++ (import ./pkg-sets/nix-related.nix { inherit pkgs; })
  ++ (import ./pkg-sets/gnome-themes.nix { inherit pkgs; })
  ;

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    delta.enable = true;
    includes = [
      { path = ../../.gitconfig; }
      { path = ../../.config/git/aliases.gitconfig; }
      { path = ../../.config/git/delta.gitconfig; }
      { path = ../../.config/git/delta-themes.gitconfig; }
    ];
  };
}
