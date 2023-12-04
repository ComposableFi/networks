{ devnet }:
let
  shared = {
    NETWORK_ID = 3;
  };
in
{

  mainnet = shared // {
    FEE = "uosmo";

    CHAIN_ID = "osmosis-1";
    DIR = "prod/.osmosisd";
    BINARY = "osmosisd";
    BLOCK_SECONDS = 6;
    NODE = "https://rpc.osmosis.zone:443";
  };
  devnet = shared // rec {
    HOME = "${devnet.devnetRootDirectory}";
    CHAIN_DATA = "${HOME}/.osmosisd";
    KEYRING_TEST = CHAIN_DATA;
    CHAIN_ID = "osmosis-dev";
    PORT = 26657 + shared.NETWORK_ID;
    RPCPORT = PORT;
    GRPCPORT = 19090;
    GRPCWEB = 20091 + shared.NETWORK_ID;
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
