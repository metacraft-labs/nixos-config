{pkgs, ...}: {
  programs.zsh.enable = true;
  programs.powerline.enable = true;

  fonts.fonts = with pkgs; [
    nerdfonts
  ];

  home.packages = with pkgs; [
    powerline
    powerline-fonts
  ];
}
