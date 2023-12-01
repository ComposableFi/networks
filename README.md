Flexible interchain multi domain registry using nextgen configuration langue to configure and output our JSON/YAML/etc.


Modify `networks.nix` and `nix run` to output JSON.

This https://github.com/cosmos/chain-registry only for mainnets and Cosmos, while target of this repo shells, devnets and non Cosmos chains.
With nix chain-registry can be used as need with one liner.

NIX allows to override inputs to replace local devnet ports as needed and validate there is no overlap.