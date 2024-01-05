{config, ...}: let
  # network = "holesky";
in {
  # services.onedrive.enable = true;

  # services.ethereum.geth."${network}" = {
  #   enable = true;
  #   args = {
  #     syncmode = "full";
  #     metrics = {
  #       addr = "0.0.0.0";
  #       enable = true;
  #     };
  #     inherit network;
  #     http = {
  #       enable = true;
  #       addr = "localhost";
  #       vhosts = ["localhost"];
  #       api = ["net" "web3" "eth"];
  #     };
  #     authrpc.jwtsecret = builtins.readFile ./jwtSecret;
  #     ipcEnable = true;
  #   };
  # };
}
