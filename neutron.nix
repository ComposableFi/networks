{devnet} : let
  shared = { NETWORK_ID = 4; BLOCK_SECONDS = 5; };
  devnetTemplate = self: rec {
    HOME = "${devnet.devnetRootDirectory}";
    BASE_DIR = HOME;
    CHAIN_DATA = "${HOME}/.neutrond";
    CHAIN_DIR = CHAIN_DATA;
    KEYRING_TEST = CHAIN_DATA;
    CHAIN_ID = "neutron-1";
    CHAINID = CHAIN_ID;
    PORT = RPCPORT;
    P2PPORT = 26756;
    RPCPORT = 28757;
    RESTPORT = 1417;
    ROSETTA = 8181;
    GRPCPORT = 19090 + self.NETWORK_ID;
    GRPCWEB = 19091 + self.NETWORK_ID;
    BLOCK_SECONDS = 6;
    STAKEDENOM = FEE;
    FEE = "untrn";
    IBCATOMDENOM = "uibcatom";
    IBCUSDCDENOM = "uibcusdc";
    BINARY = "neutrond";
    NODE = "https://locahost:${builtins.toString PORT}";
  };
  mainnetTemplate = self: rec {
    STAKEDENOM = FEE;
    FEE = "untrn";
    IBCATOMDENOM = "uibcatom";
    IBCUSDCDENOM = "uibcusdc";
    NETWORK_ID = 4;
    CHAIN_ID = "neutron-1";
    DIR = "prod/.neutrond";
    BINARY = "neutrond";
    BLOCK_SECONDS = 6;
    NODE = "https://rpc.neutron.zone:443";
  };
in
{
  devnet = let overriden = devnetTemplate (shared // overriden); in overriden;
  mainnet = let overriden = mainnetTemplate (shared // overriden); in overriden;
}
