# - common modules for clis (jq/dasel/base32cli/etc), never speific for specific chain
# - common bash scripts for cosmos sdk/polkadot chains init/gen/run/clean up/teardown
# - sure NO process manager integration/modules
# dasel put --type=string --write=toml --file="$CONFIG_FOLDER"/client.toml --value  "test" "keyring-backend"
# dasel put --type=string --write=toml --file="$CONFIG_FOLDER"/client.toml --value "json" "output" 
# dasel put --type=string --write=toml --file="$CONFIG_FOLDER"/client.toml --value "${env.NODE}" "node" 
# dasel put --type=string --write=toml --file="$CONFIG_FOLDER"/client.toml --value  "${env.CHAIN_ID}" "chain-id"
# dasel put --type=string --write=toml --file="$CONFIG_FOLDER"/client.toml --value  "sync" "broadcast-mode"
