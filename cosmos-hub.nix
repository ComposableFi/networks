{ devnet }:
let
  shared = rec {
    BINARY = "gaiad";
    CHAIN_ID = "cosmos-hub-4";
    CHAINID = CHAIN_ID;
    STAKEDENOM = FEE;
    FEE = "uatom";
    NETWORK_ID = 5;
    BLOCK_SECONDS = 6;
  };
in
{
  mainnet = shared // {
    DIR = "prod/.gaiad";
    NODE = "https://rpc.cosmos-hub.zone:443";
  };
  devnet = rec {
    P2PPORT = 26856;
    RPCPORT = 28857;
    RESTPORT = 1516;
    ROSETTA = 8281;
    GRPCPORT = 19090 + shared.NETWORK_ID;
    GRPCWEB = 19091 + shared.NETWORK_ID;
    HOME = "${devnet.devnetRootDirectory}";
    CHAIN_DATA = "${HOME}/.gaiad";
    KEYRING_TEST = CHAIN_DATA;
    PORT = RPCPORT;
    NODE = "https://locahost:${builtins.toString PORT}";
  };
}

