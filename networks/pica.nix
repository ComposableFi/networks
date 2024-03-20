{ devnet }:
let
  self = {
    FEE = "ppica";
    NETWORK_ID = 2;
    ACCOUNT_PREFIX = "centauri";
    BINARY = "centaurid";
  };
in
{
  mainnet = self // rec {
    CHAIN_ID = "centauri-1";
    DIR = "prod/.banksy";
    NODE = RPC;
    BLOCK_TIME = 7;
    RPC = https://composable-rpc.polkachu.com:443;
    GRPC_SECURE = https://composable-grpc.polkachu.com:22290;
    GRPC = http://composable-grpc.polkachu.com:22290;
    CVM_OUTPOST_CONTRACT_ADDRESS = "centauri1vlh6knyx870k2mc9fspx08ka4fuddsxx6s8tjp83n7xkyckkgm8q25mwr6";
  };
  testnet = self // {
    CHAIN_ID = "banksy-testnet-3";
    DIR = "testnet/.banksy";
    NODE = "https://rpc-t.composable.nodestake.top:443";
    BLOCK_TIME = 7;
  };
  devnet = self // rec {
    HOME = "${devnet.directories.DEVNET_DATA_DIRECTORY}";
    LOG_DIRECTORY="${devnet.directories.DEVNET_LOG_DIRECTORY}/.banksy/logs";
    BASE_DIR = HOME;
    CHAIN_DIR_NAME = ".banksy";
    BLOCK_SECONDS=5;
    CHAIN_DATA = "${HOME}/${CHAIN_DIR_NAME}";
    CHAIN_DIR = CHAIN_DATA;
    CONFIG_FOLDER = "${CHAIN_DATA}/config";
    KEYRING_TEST = CHAIN_DATA;
    RESTPORT = 1516;
    CONSENSUS_RPC_PORT = 26657;
    CONSENSUS_GRPC_PORT = 27657;
    GRPCPORT = 9090;
    GRPWEB = 9091;
    CHAIN_ID = "centauri-dev";
    NODE = "tcp://127.0.0.1:${builtins.toString CONSENSUS_RPC_PORT}";
  };
}
