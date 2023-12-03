{ devnet }:
let
  shared = {
    FEE = "ppica";
    NETWORK_ID = 2;
    PREFIX = "centauri";
    BINARY = "centaurid";
  };
in
{
  mainnet = shared // {
    CHAIN_ID = "centauri-1";
    DIR = "prod/.centaurid";
    NODE = "https://rpc.composable.nodestake.top:443";
    BLOCK_TIME = 7;
  };
  testnet = shared // {
    CHAIN_ID = "banksy-testnet-3";
    DIR = "testnet/.centaurid";
    NODE = "https://rpc-t.composable.nodestake.top:443";
    BLOCK_TIME = 7;
  };
  devnet = shared // rec {
    HOME = "${devnet.devnetRootDirectory}";
    BASE_DIR = HOME;
    CHAIN_DATA = "${HOME}/.centaurid";
    CHAIN_DIR = CHAIN_DATA;
    KEYRING_TEST = CHAIN_DATA;
    PORT = 26657;
    RPCPORT = PORT;
    GRPCPORT = 9090;
    CHAIN_ID = "centauri-1";
    DIR = CHAIN_DATA;
    NODE = "tcp://localhost:${builtins.toString PORT}";
    BLOCK_TIME = 7;
  };
}
