{
  pkgs,
  unstablePkgs,
  ...
}: {
  home.packages = with pkgs; [
    ## Browsers:
    google-chrome
    firefox # opera

    ## Audio & video players:
    spotify
    vlc
    mpv
    obsidian

    ## Office:
    libreoffice
    onlyoffice-bin
    # xournal

    ## IM / Video:
    unstablePkgs.discord
    tdesktop
    # viber
    # slack
    # unstablePkgs.tdesktop
    # teams
    zoom-us
    # resp-app

    # Text editors / IDEs
    (
      vscode-with-extensions.override
      {
        vscodeExtensions = with vscode-extensions;
          [
            matklad.rust-analyzer
            vadimcn.vscode-lldb
            bungcip.better-toml
            esbenp.prettier-vscode
            # tomoki1207.pdf
            davidanson.vscode-markdownlint
            editorconfig.editorconfig
            donjayamanne.githistory
            dbaeumer.vscode-eslint
            kamadorueda.alejandra
            bbenoist.nix
            # ms-dotnettools.csharp
            mhutchie.git-graph
            github.copilot
            ms-python.python
            ms-vscode.cpptools
            eamodio.gitlens
            waderyan.gitblame
            streetsidesoftware.code-spell-checker
            tamasfe.even-better-toml
          ]
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace
          [
            {
              publisher = "tintinweb";
              name = "vscode-inline-bookmarks";
              version = "0.1.0";
              sha256 = "sha256-XnZiR+/3haqzJnnSzda0uhcViqg77dYcYrCcWx3nywg=";
            }
            {
              publisher = "DanielSanMedium";
              name = "dscodegpt";
              version = "2.1.10";
              sha256 = "sha256-LpL1skEg23QOang7Pe1Nu8BcaqsWxPwa3MqJb6D96KU=";
            }
            {
              publisher = "julialang";
              name = "language-julia";
              version = "1.40.1";
              sha256 = "sha256-BPF8J5DubzBesmO+nbMTbH76tVrkd7fQykzt1zDSgt8=";
            }
            {
              publisher = "nimsaem";
              name = "nimvscode";
              version = "0.1.26";
              sha256 = "sha256-unxcnQR2ccsydVG3H13e+xYRnW+3/ArIuBt0HlCLKio=";
            }
            {
              publisher = "tonybaloney";
              name = "vscode-pets";
              version = "1.22.0";
              sha256 = "sha256-0AVKNePQe8Kp0phxXefLKnWIH3SjIurUQlrnmEnMs2s=";
            }
            {
              publisher = "ms-vscode";
              name = "remote-repositories";
              version = "0.21.2022100601";
              sha256 = "sha256-Drm6b+2kPDadpr1obc6s0QOgEpxndiFM4RZIXH6uC/Q=";
            }
            # {
            #   publisher = "webfreak";
            #   name = "debug";
            #   version = "0.26.0";
            #   sha256 = "sha256-ZFrgsycm7/OYTN2sD3RGJG+yu0hTvADkHK1Gopm0XWc=";
            # }
            # {
            #   name = "rust-and-friends";
            #   publisher = "nyxiative";
            #   version = "1.0.0";
            #   sha256 = "sha256-0Rbxq+p4G7hHxk/YR80g9jkSvr1HCxHhg6s7idSKyC0=";
            # }
            # {
            #   name = "cpptools-extension-pack";
            #   publisher = "ms-vscode";
            #   version = "1.3.0";
            #   sha256 = "sha256-rHST7CYCVins3fqXC+FYiS5Xgcjmi7QW7M4yFrUR04U=";
            # }
            # {
            #   name = "cmake-tools";
            #   publisher = "ms-vscode";
            #   version = "1.13.11";
            #   sha256 = "sha256-RCnIgLH3J3gZFWCpe8JXValx5qGXTysValwR2vn0xPg=";
            # }
            {
              name = "lalrpop-highlight";
              publisher = "mnxn";
              version = "0.0.1";
              sha256 = "sha256-teyL4IGx1rtgpXsRtuBft4xlpJrtktYuCl4HaH3pm3c=";
            }
            {
              name = "vscode-solidity-language";
              publisher = "tintinweb";
              version = "0.0.7";
              sha256 = "sha256-m4mED7WWfIfjx+ZukYVQ3Ta2nPZSnRiS9XRsdXf3Fzs=";
            }
            # {
            #   name = "rust-flash-snippets";
            #   publisher = "lorenzopirro";
            #   version = "2.0.1";
            #   sha256 = "sha256-NBr2dHFkbNXtP6+3HmeAcvH4nRs4L2BSytNX0bpFLdM=";
            # }
            # {
            #   name = "rust-extension-pack";
            #   publisher = "zerotaskx";
            #   version = "1.1.0";
            #   sha256 = "sha256-h/DUlhcGiBV6bToshK1IiBzxVQgegfQ/7QZcU9Zb55U=";
            # }
            {
              name = "ts-debug";
              publisher = "kakumei";
              version = "0.0.6";
              sha256 = "sha256-MgsUthDbrJp6yIj9MMNDWBar0Q5b+8GQTPDuthVaQxI=";
            }
            # {
            #   name = "better-cpp-syntax";
            #   publisher = "jeff-hykin";
            #   version = "1.16.1";
            #   sha256 = "sha256-S0+JieVbzPvSWnhl0H52f0nzMv0+sMa4J8FSjEm5Pxs=";
            # }
            {
              name = "remotehub";
              publisher = "github";
              version = "0.44.0";
              sha256 = "sha256-LgZztRUNHtsL3oTJCl/nxoboE0YQ00BE4/0mFMQKr2s=";
            }
            {
              name = "syntax-highlighter";
              publisher = "evgeniypeshkov";
              version = "0.5.0";
              sha256 = "sha256-2XUuI90rVnC8pRUgAOPw3wHa3GcnuGIr2U/qTCn3dKA=";
            }
            {
              name = "solidity-debugger";
              publisher = "hosho";
              version = "0.2.1";
              sha256 = "sha256-/dykzuTzByAmMIjPJCHqEwu/gIwsswzrcAfrTik8NTw=";
            }
            {
              name = "rust-syntax";
              publisher = "dustypomerleau";
              version = "0.6.1";
              sha256 = "sha256-o9iXPhwkimxoJc1dLdaJ8nByLIaJSpGX/nKELC26jGU=";
            }
            {
              name = "vscode-circom-pro";
              publisher = "tintinweb";
              version = "0.0.4";
              sha256 = "sha256-nskvJaiX2CWHhau2eUtyQRuFBoa4Dae0LHjMJSz7afk=";
            }
            {
              name = "circom-plus";
              publisher = "vuvoth";
              version = "0.0.4";
              sha256 = "sha256-ZscWIxQWWwkHf0eRfonUaZzCjB7k3xMG1g57hwvy7Fc=";
            }
            # {
            #   name = "doxdocgen";
            #   publisher = "cschlosser";
            #   version = "1.4.0";
            #   sha256 = "sha256-InEfF1X7AgtsV47h8WWq5DZh6k/wxYhl2r/pLZz9JbU=";
            # }
            {
              name = "circom";
              publisher = "iden3";
              version = "0.0.2";
              sha256 = "sha256-1cvVae229t8eZQftHEkmHGqv5/BoRW4PGBQCcNbfe8s=";
            }
            {
              name = "solidity";
              publisher = "JuanBlanco";
              version = "0.0.163";
              sha256 = "sha256-CJSI3uwKgiWBI+oMSGrOEIfWbCxE2OW+ZJ7a/zLVOlg=";
            }
            {
              name = "hardhat-solidity";
              publisher = "NomicFoundation";
              version = "0.7.3";
              sha256 = "sha256-uxaqEk/dUu0hhMkLBzBGzdN0GxVq8dvwDc1gEPOqvOg=";
            }
            {
              name = "Go";
              publisher = "golang";
              version = "0.35.1";
              sha256 = "sha256-MHQrFxqSkcpQXiZQoK8e+xVgRjl3Db3n72hrQrT98lg=";
            }
            {
              name = "remote-explorer";
              publisher = "ms-vscode";
              version = "0.1.2022092609";
              sha256 = "sha256-Fada2jRPmSiGw8KyobUbnxJaReQKA8dMtOxGBhcCvtc=";
            }
            {
              name = "circom-lsp";
              publisher = "rubydusa";
              version = "0.0.3";
              sha256 = "sha256-moOjDV/XxSxRwpQ9rZwRJqgPUMs8zjUPvh9YVKLZKqo=";
            }
          ];
      }
    )

    # vscode-fhs

    ## API clients:
    # insomnia
    postman

    ## Remote desktop:
    # remmina
    # teamviewer

    ## P2P:
    deluge
    transmission-gtk

    ## Terminal emulators:
    # alacritty
    tilix

    ## Audio editing:
    # reaper audacity

    ## 3D modeling:
    # blender

    ## Image editing:
    gimp
    inkscape
    pick-colour-picker
    gcolor3

    ## X11, OpenGL, Vulkan:
    xclip
    xorg.xhost
    glxinfo
    vulkan-tools

    ## System:
    gparted
    wireshark-qt

    ## Git
    qgit
  ];
}
