{ devnet }:
let
  self = {
    NETWORK_ID = 4;
    BLOCK_SECONDS = 5;
    BINARY = "neutrond";
    FEE = "untrn";
    ACCOUNT_PREFIX = "neutron";
  };
  devnetTemplate = self: rec {
    HOME = "${devnet.devnetRootDirectory}";
    BASE_DIR = HOME;
    CHAIN_DATA = "${HOME}/.neutrond";
    CHAIN_DIR = CHAIN_DATA;
    KEYRING_TEST = CHAIN_DATA;
    CHAINID = CHAIN_ID;
    PORT = RPCPORT;
    P2PPORT = 26756 + self.NETWORK_ID;
    RPCPORT = 26657 + self.NETWORK_ID;
    RESTPORT = 1516 + self.NETWORK_ID;
    ROSETTA_PORT = 8181 + self.NETWORK_ID;
    CONSENSUS_GRPC_PORT = 39090 + self.NETWORK_ID;
    CONSENSUS_RPC_PORT = 38090 + self.NETWORK_ID;
    GRPCPORT = 19090 + self.NETWORK_ID;
    GRPCWEB = 20091 + self.NETWORK_ID;
    CONFIG_FOLDER = "${CHAIN_DATA}/config";
    BLOCK_SECONDS = 6;
    STAKEDENOM = self.FEE;
    IBCATOMDENOM = "uibcatom";
    IBCUSDCDENOM = "uibcusdc";
    CHAIN_ID = "neutron-dev";
    NODE = "https://locahost:${builtins.toString RPCPORT}";
  };
  mainnetTemplate = self: rec {
    STAKEDENOM = self.FEE;
    IBCATOMDENOM = "uibcatom";
    IBCUSDCDENOM = "uibcusdc";
    CHAIN_ID = "neutron-1";
    DIR = "prod/.neutrond";
    NODE = "https://rpc.neutron.nodestake.top:443";
  };
in
{
  devnet = let overriden = devnetTemplate self; in self // overriden;
  mainnet = let overriden = mainnetTemplate self; in self // overriden;
}
