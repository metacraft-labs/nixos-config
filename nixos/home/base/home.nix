{
  config,
  pkgs,
  username,
  ...
}: {
  home = {
    inherit username;
    homeDirectory =
      if pkgs.hostPlatform.isDarwin
      then "/Users/${username}"
      else "/home/${username}";
    stateVersion = "23.05";
  };

  manual.manpages.enable = false;
  programs.home-manager.enable = true;
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };
}
