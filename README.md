Flexible interchain multi domain registry using Nix configuration language to configure and output our JSON/YAML/etc with deep integration with shell.

## Usage

### JSON

JSON output can be read directly by TypeScript and other tooling.


### NIX

Can be used as flake input or nixos module , so can be forked, modified, and used as `input-override` or override option in module import.

## How to update


1. Modify `networks` and `nix run` to output JSON.
2. share changes via GIT

## Why not https://github.com/cosmos/chain-registry 

It only for mainnets and Cosmos, while this repo additionally targets shells, devnets and non Cosmos chains.
With nix `chain-registry` can be used as need with one liner as dependency of this repo.

## Internals

During JSON generation it checks all local ports and remote urls are unique.

Local ports are checked not to be in well known list.

### Why not OCI (Docker/K8S) YAML(Helm/Kustomize)

With Nix there is no need for YAML, and part of OCI stack (dependency 'hell' and hermetic isolated builds) is solved.