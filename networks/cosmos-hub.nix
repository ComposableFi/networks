{ devnet }:
let
  shared = rec {
    BINARY = "gaiad";
    STAKEDENOM = FEE;
    FEE = "uatom";
    NETWORK_ID = 5;
    BLOCK_SECONDS = 6;
  };
in
{
  mainnet = shared // {
    CHAIN_ID = "cosmos-hub-4";
    DIR = "prod/.gaiad";
    NODE = "https://rpc.cosmos-hub.zone:443";
  };
  devnet = shared // rec {
    CHAIN_ID = "cosmos-hub-dev";
    P2PPORT = 26856;
    RPCPORT = 28757 + shared.NETWORK_ID;
    RESTPORT = 1516;
    ROSETTA = 8281;
    GRPCPORT = 19090 + shared.NETWORK_ID;
    GRPCWEB = 19091 + shared.NETWORK_ID;
    HOME = "${devnet.devnetRootDirectory}";
    BASE_DIR = HOME;
    CHAIN_DATA = "${HOME}/.gaiad";
    CHAIN_DIR = CHAIN_DATA;
    KEYRING_TEST = CHAIN_DATA;
    PORT = RPCPORT;
    NODE = "https://locahost:${builtins.toString PORT}";
  };
}

