rec {
  devnet = {
    devnetRootDirectory = "/tmp/composable-devnet";
    mnemonics = {
      VAL_MNEMONIC_1 = "'clock post desk civil pottery foster expand merit dash seminar song memory figure uniform spice circle try happy obvious trash crime hybrid hood cushion'";
      VAL_MNEMONIC_2 = "'angry twist harsh drastic left brass behave host shove marriage fall update business leg direct reward object ugly security warm tuna model broccoli choice'";
      DEMO_MNEMONIC_1 = "'banner spread envelope side kite person disagree path silver will brother under couch edit food venture squirrel civil budget number acquire point work mass'";
      DEMO_MNEMONIC_2 = "'veteran try aware erosion drink dance decade comic dawn museum release episode original list ability owner size tuition surface ceiling depth seminar capable only'";
      DEMO_MNEMONIC_3 = "'obscure canal because tomorrow tribe sibling describe satoshi kiwi upgrade bless empty math trend erosion oblige donate label birth chronic hazard ensure wreck shine'";
      RLY_MNEMONIC_1 = "'alley afraid soup fall idea toss can goose become valve initial strong forward bright dish figure check leopard decide warfare hub unusual join cart'";
      RLY_MNEMONIC_2 = "'record gift you once hip style during joke field prize dust unique length more pencil transfer quit train device arrive energy sort steak upset'";
    };
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
  neutron =
    let
      shared = { NETWORK_ID = 4;PORT = 1232133; };
      devnetTemplate = self : rec {
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
        BLOCK_SECONDS = 5;
        STAKEDENOM = FEE;
        FEE = "untrn";
        IBCATOMDENOM = "uibcatom";
        IBCUSDCDENOM = "uibcusdc";
        BINARY = "neutrond";
        NODE = "https://locahost:${builtins.toString PORT}";
      };
    in
    {
      devnet = let overriden = devnetTemplate ( overriden // shared); in overriden;  
      mainnet = shared // rec {
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
    };
  cosmos-hub = {
    mainnet = {
      FEE = "uatom";
      NETWORK_ID = 5;
      CHAIN_ID = "cosmoshub-4";
      DIR = "prod/.gaiad";
      BINARY = "gaiad";
      BLOCK_SECONDS = 6;
      NODE = "https://rpc.neutron.zone:443";
    };
    devnet = rec {
      HOME = "${devnet.devnetRootDirectory}";
      CHAIN_DATA = "${HOME}/.gaiad";
      KEYRING_TEST = CHAIN_DATA;
      CHAIN_ID = "test-2";
      PORT = 26957;
      BLOCK_SECONDS = 5;
      FEE = "uatom";
      BINARY = "gaiad";
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
