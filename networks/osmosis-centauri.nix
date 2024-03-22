{ devnet, chain_a, chain_b }:
{
  devnet = rec {
    TELEMETRY_PORT = 30142;
    REST_PORT = 31066;
    RELAY_DATA = "${devnet.directories.DATA_DIRECTORY}/osmosis-centauri";
    CHAIN_ID_A = chain_a.devnet.CHAIN_ID;
    CHAIN_ID_B = chain_b.devnet.CHAIN_ID;
  };
}