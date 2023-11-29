rec {
  devnet = {
    devnetRootDirectory = "/tmp/composable-devnet";
  };
  pica = {
    mainnet = {
      FEE = "ppica";
      NETWORK_ID = 2;
      CHAIN_ID = "centauri-1";
      DIR = "prod/.centaurid";
      BINARY = "centaurid";
      NODE = "https://rpc.composable.nodestake.top:443";
      BLOCK_TIME = 7;
    };
    testnet = {
      FEE = "ppica";
      NETWORK_ID = 2;
      CHAIN_ID = "banksy-testnet-3";
      DIR = "testnet/.centaurid";
      BINARY = "centaurid";
      NODE = "https://rpc-t.composable.nodestake.top:443";
      BLOCK_TIME = 7;
    };
    devnet = rec {
      FEE = "ppica";
      NETWORK_ID = 2;
      PORT = 26657;
      CHAIN_ID = "centauri-dev";
      DIR = "testnet/.centaurid";
      BINARY = "centaurid";
      NODE = "tcp://localhost:${builtins.toString PORT}";
      BLOCK_TIME = 7;
    };
  };
  neutron = {
    mainnet = {
      FEE = "untrn";
      NETWORK_ID = 4;
      CHAIN_ID = "neutron-1";
      DIR = "prod/.neutrond";
      BINARY = "neutrond";
      BLOCK_SECONDS = 6;
      NODE = "https://rpc.neutron.zone:443";
    };
    devnet = rec {
      HOME = "${devnet.devnetRootDirectory}";
      CHAIN_DATA = "${HOME}/.neutrond";
      KEYRING_TEST = CHAIN_DATA;
      CHAIN_ID = "neutron-1";
      PORT = 26857;
      BLOCK_SECONDS = 5;
      FEE = "untrn";
      BINARY = "neutrond";
      NODE = "https://locahost:PORT";
    };

  };
  osmosis = {
    mainnet = {
      FEE = "uosmo";
      NETWORK_ID = 3;
      CHAIN_ID = "osmosis-1";
      DIR = "prod/.osmosisd";
      BINARY = "osmosisd";
      BLOCK_SECONDS = 6;
      NODE = "https://rpc.osmosis.zone:443";
    };
    devnet = rec {
      HOME = "${devnet.devnetRootDirectory}";
      CHAIN_DATA = "${HOME}/.osmosisd";
      KEYRING_TEST = CHAIN_DATA;
      CHAIN_ID = "osmosis-dev";
      PORT = 26757;
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
  };
}
