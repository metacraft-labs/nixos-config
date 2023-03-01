{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    omf-bobthefish.url = "github:oh-my-fish/theme-bobthefish";
    omf-bobthefish.flake = false;
  };

  outputs = { nixpkgs, home-manager, omf-bobthefish, ... }:
    let
      system = "x86_64-linux";
      stdenv = import stdenv;
      nodejs = import nodejs;
      pkgs = import nixpkgs {
            inherit system;
            inherit stdenv;
            inherit nodejs;
            config = {allowUnfree = true;};
          };
    in {
      homeConfigurations = rec {
        nikola = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          #  configuration = { ... }: {
          #     imports = [ ./home.nix ];
          #     nixpkgs = { inherit (pkgs) config overlays; };
          #   };
          #   homeDirectory ="/home/nikola";
          #   username = "nikola";

          extraSpecialArgs = {
            inherit omf-bobthefish;
          };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./home.nix ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      };
    };
}
