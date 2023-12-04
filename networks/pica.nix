{ devnet }:
let
  self = {
    FEE = "ppica";
    NETWORK_ID = 2;
    PREFIX = "centauri";
    BINARY = "centaurid";
  };
in
{
  mainnet = self // {
    CHAIN_ID = "centauri-1";
    DIR = "prod/.centaurid";
    NODE = "https://rpc.composable.nodestake.top:443";
    BLOCK_TIME = 7;
    RPC = https://composable-rpc.polkachu.com:443;
    GRPC = https://composable-grpc.polkachu.com:22290; 
  };
  testnet = self // {
    CHAIN_ID = "banksy-testnet-3";
    DIR = "testnet/.centaurid";
    NODE = "https://rpc-t.composable.nodestake.top:443";
    BLOCK_TIME = 7;
  };
  devnet = self // rec {
    HOME = "${devnet.devnetRootDirectory}";
    BASE_DIR = HOME;
    CHAIN_DATA = "${HOME}/.centaurid";
    CHAIN_DIR = CHAIN_DATA;
    KEYRING_TEST = CHAIN_DATA;
    PORT = 26657;
    RESTPORT = 1516;
    RPCPORT = PORT;
    GRPCPORT = 9090;
    GRPWEB = 9091;
    CHAIN_ID = "centauri-dev";
    DIR = CHAIN_DATA;
    NODE = "tcp://localhost:${builtins.toString PORT}";
    BLOCK_TIME = 7;
  };
}
