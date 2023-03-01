{ config, pkgs, omf-bobthefish, lib, ... }:
with pkgs;
with lib;
let 
  corepack = pkgs.stdenv.mkDerivation {
    name = "corepack-shims";
    buildInputs = [pkgs.nodejs];
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/bin
      corepack enable --install-directory=$out/bin
    '';
  };
  sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_7_0}";
  };
  aliases = {
    lsa = "ls -ltra";
    cdcon = "cd ~/.config/nixpkgs";
    glo = "git log --oneline";
  };
  omnisharp-vscode-fromVsix = pkgs.callPackage ./omnisharp-vscode.nix {};
  omnisharp-vscode-fromZip = pkgs.callPackage pkgs.vscode-utils.buildVscodeExtension {
            name = "ms-dotnettools.csharp";
            src = /home/nikola/.config/nixpkgs/csharp-1.25.2-linux-x64.zip;
            version = "1.25.2";
            vscodeExtUniqueId = "microsoft.csharp";
            vscodeExtPublisher = "ms-dotnettools";  
            vscodeExtName = "csharp";    
          };
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nikola";
  home.homeDirectory = "/home/nikola";

  programs.git = {
    enable = true;
    userName = "Nikola Gamzakov";
    userEmail = "nikola.gamzakov@hotmail.com";
  };
  
  home.packages = [                               
    vim
    vscode-fhs
    postman
    nodejs-18_x
    powershell
    go
    beekeeper-studio
    docker
    docker-compose
    jetbrains.rider
    inkscape

    imagemagick
    act    
    tcl
    gnumake
    sqlite
    tree
    sqlitebrowser
    gcc 
    tmate
    stdenv
    ngrok
    bat    
    fish
    alejandra
    dconf2nix
    firefox
    chromium
    discord
    git    
    keepassxc
    thunderbird
    gnome.gnome-tweaks
    tilix
    (with dotnetCorePackages; combinePackages [
      sdk_7_0
      sdk_6_0
    ])
    gnomeExtensions.vertical-overview
    gnomeExtensions.hide-top-bar
    gnomeExtensions.gtk-title-bar
  ];

  home.sessionVariables = sessionVariables;
  programs.direnv.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = aliases;
    sessionVariables = sessionVariables;
    bashrcExtra = ''
      source ~/.bash_git
      PS1='\[$(tput bold)\]\[\033[38;5;46m\]\t\] \033[38;5;33m\]$PWD\[\033[38;5;196m\]$(__git_ps1)\[$(tput sgr0)\]\n\[$(tput bold)\]\$\[$(tput sgr0)\] '
      export PATH="$PATH:/home/nikola/.dotnet/tools"
    '';
  };

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "fish-theme-bobthefish";
        src = omf-bobthefish;
      }
    ];
    interactiveShellInit = ''
      # bobthefish theme settings:
      set -g theme_newline_cursor yes
      set -g theme_date_format "+%H:%M:%S %F (%a)"
      set -g theme_color_scheme dark
      set -g theme_display_vi yes
      set -g theme_display_nix yes
      set -g theme_use_abbreviated_branch_name no
      set -g theme_display_git_master_branch yes
      set -g theme_prompt_prefix   '╭─'
      set -g theme_newline_prompt ' ╰─➤ '
      set -g theme_nerd_fonts yesr
      set -g theme_display_node yes
      fish_add_path "/home/nikola/.dotnet/tools"
    '';
    shellAliases = aliases;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
