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
  };
  devnet = self // rec {
    BINARY = "osmosisd";
    BLOCK_SECONDS = 5;
    CHAIN_DATA = ".osmosisd";
    CHAIN_ID = "osmosis-dev";
    CONFIG_FOLDER = "${CHAIN_DATA}/config";        
    CONSENSUS_GRPC_PORT = 39090 + self.NETWORK_ID;
    CONSENSUS_RPC_PORT = 38090 + self.NETWORK_ID;
    FEE = "uosmo";
    GRPCPORT = 19090 + self.NETWORK_ID;
    GRPCWEB = 20091 + self.NETWORK_ID;
    KEYRING_TEST = CHAIN_DATA;
    NODE = "tcp://127.0.0.1:${builtins.toString CONSENSUS_RPC_PORT}";
    P2PPORT = 26756 + self.NETWORK_ID;
    PROMETHEUS_PORT = 36660 + self.NETWORK_ID;
    RESTPORT = 1516 + self.NETWORK_ID;
    RPCPORT = 26657 + self.NETWORK_ID;
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
