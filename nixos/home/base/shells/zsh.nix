{pkgs, ...}: {
  programs.zsh.enable = true;
  programs.zsh.initExtra = ''
    source ~/.zshrc.bak'';

  home.packages = with pkgs; [
    powerline
    powerline-fonts
  ];
}
