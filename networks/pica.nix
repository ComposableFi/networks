{ devnet }:
let
  self = {
    FEE = "ppica";
    NETWORK_ID = 2;
    ACCOUNT_PREFIX = "centauri";
    BINARY = "centaurid";
  };
in
{
  mainnet = self // rec {
    CHAIN_ID = "centauri-1";
    DIR = "prod/.centaurid";
    NODE = RPC;
    BLOCK_TIME = 7;
    RPC = https://composable-rpc.polkachu.com:443;
    GRPC = https://composable-grpc.polkachu.com:22290;
    CVM_OUTPOST_CONTRACT_ADDRESS = "centauri1lkh7p89tdhkc52vkza5jus5xmgjqjut6ngucsn88mhmzaqc02h5qu89k2u";
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
    RESTPORT = 1516;
    CONSENSUS_RPC_PORT = 26657;
    GRPCPORT = 9090;
    GRPWEB = 9091;
    CHAIN_ID = "centauri-dev";
    DIR = CHAIN_DATA;
    NODE = "tcp://localhost:${builtins.toString CONSENSUS_RPC_PORT}";
    BLOCK_TIME = 7;
  };
}
