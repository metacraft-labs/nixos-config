{pkgs, ...}: {
  programs.bash.enable = true;
  programs.bash.shellAliases = {
    mc = ". ${pkgs.mc}/libexec/mc/mc-wrapper.sh";
  };
  home.packages = with pkgs; [bash];
}
