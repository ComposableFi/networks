{ devnet }:
let
  self = rec {
    BINARY = "gaiad";
    STAKEDENOM = FEE;
    FEE = "uatom";
    NETWORK_ID = 5;
    BLOCK_SECONDS = 6;
    ACCOUNT_PREFIX = "cosmos";
  };
in
{
  mainnet = self // {
    CHAIN_ID = "cosmos-hub-4";
    DIR = "prod/.gaiad";
    NODE = "https://rpc.cosmos.nodestake.top:443";
  };
  devnet = self // rec {
    CHAIN_ID = "cosmos-hub-dev";
    ROSETTA_PORT = 8181 + self.NETWORK_ID;
    P2PPORT = 26756 + self.NETWORK_ID;
    RPCPORT = 26657 + self.NETWORK_ID;
    RESTPORT = 1516 + self.NETWORK_ID;
    GRPCPORT = 19090 + self.NETWORK_ID;
    CONSENSUS_GRPC_PORT = 39090 + self.NETWORK_ID;
    CONSENSUS_RPC_PORT = 38090 + self.NETWORK_ID;
    GRPCWEB = 20091 + self.NETWORK_ID;
    HOME = "${devnet.devnetRootDirectory}";
    BASE_DIR = HOME;
    CHAIN_DATA = "${HOME}/.gaiad";
    CONFIG_FOLDER = "${CHAIN_DATA}/config";
    CHAIN_DIR = CHAIN_DATA;
    KEYRING_TEST = CHAIN_DATA;
    PORT = RPCPORT;
    NODE = "https://locahost:${builtins.toString PORT}";
  };
}

