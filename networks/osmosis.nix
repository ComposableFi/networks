{ devnet }:
let
  self = {
    NETWORK_ID = 3;
    ACCOUNT_PREFIX = "osmo";
  };
in
{
  mainnet = self // {
    FEE = "uosmo";
    CHAIN_ID = "osmosis-1";
    DIR = "prod/.osmosisd";
    BINARY = "osmosisd";
    BLOCK_SECONDS = 6;
    NODE = "https://rpc.osmosis.zone:443";    
    CVM_OUTPOST_CONTRACT_ADDRESS = "osmo1sy7pdmawyerekcl6xwz4v2p87j726auntcu48fvhsy24rkhv7n4s9yg267";
  };
  devnet = self // rec {
    HOME = "${devnet.devnetRootDirectory}";
    CHAIN_DATA = "${HOME}/.osmosisd";
    KEYRING_TEST = CHAIN_DATA;
    CHAIN_ID = "osmosis-dev";
    RPCPORT = 26657 + self.NETWORK_ID;
    GRPCPORT = 19090 + self.NETWORK_ID;
    GRPCWEB = 20091 + self.NETWORK_ID;
    RESTPORT = 1516 + self.NETWORK_ID;
    PROMETHEUS_PORT = 36660 + self.NETWORK_ID;
    CONFIG_FOLDER = "${CHAIN_DATA}/config";        
    CONSENSUS_GRPC_PORT = 39090 + self.NETWORK_ID;
    CONSENSUS_RPC_PORT = 38090 + self.NETWORK_ID;
    P2PPORT = 26756 + self.NETWORK_ID;
    BLOCK_SECONDS = 5;
    FEE = "uosmo";
    BINARY = "osmosisd";
  };

  remote-devnet = {
    FEE = "uosmo";
    NETWORK_ID = 3;
    CHAIN_ID = "osmosis-dev";
    DIR = "remote-devnet/.osmosisd";
    BINARY = "osmosisd";
    BLOCK_SECONDS = 6;
    NODE =
      "https://static.28.137.109.65.clients.your-server.de:443/osmosis/";
  };

  testnet = {
    FEE = "uosmo";
    NETWORK_ID = 3;
    CHAIN_ID = "osmo-test-5";
    DIR = "testnet/.osmosisd";
    BINARY = "osmosisd";
    BLOCK_SECONDS = 6;
    NODE = "https://rpc.testnet.osmosis.zone:443";
  };
}
