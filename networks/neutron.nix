{ devnet }:
let
  shared = {
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
    P2PPORT = 26756;

    RPCPORT = 28757;
    RESTPORT = 1317 + self.NETWORK_ID;
    ROSETTA = 8181;
    GRPCPORT = 19090 + self.NETWORK_ID;
    GRPCWEB = 20091 + self.NETWORK_ID;
    BLOCK_SECONDS = 6;
    STAKEDENOM = self.FEE;
    IBCATOMDENOM = "uibcatom";
    IBCUSDCDENOM = "uibcusdc";
    CHAIN_ID = "neutron-dev";
    NODE = "https://locahost:${builtins.toString PORT}";
  };
  mainnetTemplate = self: rec {
    STAKEDENOM = self.FEE;
    IBCATOMDENOM = "uibcatom";
    IBCUSDCDENOM = "uibcusdc";
    CHAIN_ID = "neutron-1";
    DIR = "prod/.neutrond";
    NODE = "https://rpc.neutron.zone:443";
  };
in
{
  devnet = let overriden = devnetTemplate shared; in shared // overriden;
  mainnet = let overriden = mainnetTemplate shared; in shared // overriden;
}
